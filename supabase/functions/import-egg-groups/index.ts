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


console.log("Hello from Functions!")

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
      db: { schema: 'pokeapi' }
    }
  );

  let fetchUrl: string | undefined = 'https://pokeapi.co/api/v2/egg-group';
  let updateCount = 0;

  while (fetchUrl) {
    const response: Pagination = await loadData<Pagination>(fetchUrl);

    response.results.forEach(async result => {
      console.log('Calling url for ' + result.name);

      const eggGroup = await loadData<EggGroup>(result.url);

      supabaseClient.from('egg_group')
      .upsert(eggGroup);

      console.log('updated egg group ' + eggGroup.name);
      updateCount++;
    });

    fetchUrl = response.next;
  }

  return new Response(

    JSON.stringify({message: `Updated ${updateCount} egg groups`}),
    { headers: { "Content-Type": "application/json" } },
  )
});
