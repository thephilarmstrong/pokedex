// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { EggGroup } from "../_shared/pokeapi/types/egg-group.ts";
import { importData } from "../_shared/pokeapi/utils/import-data.ts";

// Setup type definitions for built-in Supabase Runtime APIs
/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />

Deno.serve(async (_) => {
  
  const { error, count } = await importData('https://pokeapi.co/api/v2/egg-group', 'egg_group', mappingFunction);

  if (error) {
    console.log(`Error code: ${error.code}`);
    console.log(`Error details: ${error.details}`);
    console.log(`Error hint: ${error.hint}`);
    console.log(`Error message: ${error.message}`);
    return new Response(
      JSON.stringify({message: `Error loading data, code: ${error.code}`}),
      { headers: { "Content-Type": "application/json" },
      status: 500,
    },
    )
  }

  return new Response(
    JSON.stringify({message: `Updated ${count} egg groups`}),
    { headers: { "Content-Type": "application/json" } },
  )
});

const mappingFunction = (input: EggGroup) => ({ id: input.id, name: input.name,});