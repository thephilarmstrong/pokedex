export interface Pagination {
    count: number;
    next?: string;
    previous?: string;
    results: Resource[]
}

export interface Resource {
    name?: string;
    url: string;
}