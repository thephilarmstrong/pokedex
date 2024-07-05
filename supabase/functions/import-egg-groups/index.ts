// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />

// import { Database, Tables } from "../../types/pokeapi.ts";
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { Pagination } from '../_shared/pokeapi/types/pagination.ts';
import { loadData } from '../_shared/utils/load-data.ts';
import { EggGroup } from '../_shared/pokeapi/types/egg-group.ts';

Deno.serve(async (req) => {
  const supabaseClient = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    {
      global: {
        headers: {
          Authorization: req.headers.get('Authorization')!
        },
      },
    }
  );

  let fetchUrl: string | undefined = 'https://pokeapi.co/api/v2/egg-group';
  let updateCount = 0;

  while (fetchUrl) {
    const response: Pagination = await loadData<Pagination>(fetchUrl);

    Promise.all(response.results
      .map(result => result.url)
      .map(url => loadData<EggGroup>(url)))
      .then(async (pokeapiResponse: EggGroup[]) => {
        const itemsToUpdate = pokeapiResponse.map(rawObject => ({ id: rawObject.id, name: rawObject.name }));

        const { data, error } = await supabaseClient.from('egg_group')
        .upsert(itemsToUpdate);

        console.log(data);
        console.log(error);
      });

      fetchUrl = response.next;
  }

  return new Response(
    JSON.stringify({message: `Updated egg groups`}),
    { headers: { "Content-Type": "application/json" } },
  )
});
