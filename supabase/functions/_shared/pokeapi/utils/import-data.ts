import { supabaseAdminClient } from '../../supabase/utils/supabase-admin-client.ts';
import { Pagination } from '../types/pagination.ts';
import { loadData } from './load-data.ts';

export const importData = async <T>(
    url: string,
    table: string,
    mappingFunction: (_: T) => T,
) => {
    let fetchUrl: string | undefined = url;

    const rowsToUpsert: T[] = [];

    while (fetchUrl) {
        console.log(`Fetching paginated data from ${fetchUrl}`);

        const response: Pagination = await loadData<Pagination>(fetchUrl);

        console.log(`Loading data for ${response.results.length} rows.`);

        Promise.all(response.results
            .map(result => result.url)
            .map(url => loadData<T>(url)))
            .then((items: T[]) => {
                items
                .map(item => mappingFunction(item))
                .forEach(item => rowsToUpsert.push(item));

                console.log(items);
            });
    
        console.log(`Updating fetchUrl to ${response.next}`);
        fetchUrl = response.next;
    }

    console.log(`Upserting ${rowsToUpsert.length} rows into table ${table}`);

    const { data, error } = await supabaseAdminClient
        .from(table)
        .upsert(rowsToUpsert);

    return { data, error, count: rowsToUpsert.length };
}