export const loadData = async <T>(url: string): Promise<T> => {
    console.log(`fetching url ${url}`);
    const response = await fetch(url);
    const body = await response.json();
    return body as T;
};