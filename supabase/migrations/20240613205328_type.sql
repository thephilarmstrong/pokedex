create table "pokeapi"."type" (
    "id" bigint generated by default as identity not null,
    "name" text not null
);


alter table "pokeapi"."type" enable row level security;

create type relation_type AS ENUM ('double', 'half', 'zero');

create table "pokeapi"."type_relation" (
    "type1" bigint not null,
    "type2" bigint not null,
    "relation_type" relation_type not null
);


alter table "pokeapi"."type_relation" enable row level security;

CREATE UNIQUE INDEX type_name_key ON pokeapi.type USING btree (name);

CREATE UNIQUE INDEX type_pkey ON pokeapi.type USING btree (id);

CREATE UNIQUE INDEX type_relation_pkey ON pokeapi.type_relation USING btree (type1, type2, relation_type);

alter table "pokeapi"."type" add constraint "type_pkey" PRIMARY KEY using index "type_pkey";

alter table "pokeapi"."type_relation" add constraint "type_relation_pkey" PRIMARY KEY using index "type_relation_pkey";

alter table "pokeapi"."type" add constraint "type_name_key" UNIQUE using index "type_name_key";

alter table "pokeapi"."type_relation" add constraint "pokeapi_type_relation_type1_fkey" FOREIGN KEY (type1) REFERENCES pokeapi.type(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "pokeapi"."type_relation" validate constraint "pokeapi_type_relation_type1_fkey";

alter table "pokeapi"."type_relation" add constraint "pokeapi_type_relation_type2_fkey" FOREIGN KEY (type2) REFERENCES pokeapi.type(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "pokeapi"."type_relation" validate constraint "pokeapi_type_relation_type2_fkey";


