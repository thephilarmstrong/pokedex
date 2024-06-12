create table "public"."type" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null
);


alter table "public"."type" enable row level security;

create table "public"."type_relation" (
    "type1_id" uuid not null,
    "type2_id" uuid not null,
    "type_relation_type" uuid not null
);


alter table "public"."type_relation" enable row level security;

create table "public"."type_relation_type" (
    "id" uuid not null,
    "name" text not null
);


alter table "public"."type_relation_type" enable row level security;

CREATE UNIQUE INDEX type_name_key ON public.type USING btree (name);

CREATE UNIQUE INDEX type_pkey ON public.type USING btree (id);

CREATE UNIQUE INDEX type_relation_pkey ON public.type_relation USING btree (type1_id, type2_id, type_relation_type);

CREATE UNIQUE INDEX type_relation_type_pkey ON public.type_relation_type USING btree (id);

alter table "public"."type" add constraint "type_pkey" PRIMARY KEY using index "type_pkey";

alter table "public"."type_relation" add constraint "type_relation_pkey" PRIMARY KEY using index "type_relation_pkey";

alter table "public"."type_relation_type" add constraint "type_relation_type_pkey" PRIMARY KEY using index "type_relation_type_pkey";

alter table "public"."type" add constraint "type_name_key" UNIQUE using index "type_name_key";

alter table "public"."type_relation" add constraint "public_type_relation_type1_id_fkey" FOREIGN KEY (type1_id) REFERENCES type(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."type_relation" validate constraint "public_type_relation_type1_id_fkey";

alter table "public"."type_relation" add constraint "public_type_relation_type2_id_fkey" FOREIGN KEY (type2_id) REFERENCES type(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."type_relation" validate constraint "public_type_relation_type2_id_fkey";

alter table "public"."type_relation" add constraint "public_type_relation_type_relation_type_fkey" FOREIGN KEY (type_relation_type) REFERENCES type_relation_type(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."type_relation" validate constraint "public_type_relation_type_relation_type_fkey";

grant delete on table "public"."type" to "anon";

grant insert on table "public"."type" to "anon";

grant references on table "public"."type" to "anon";

grant select on table "public"."type" to "anon";

grant trigger on table "public"."type" to "anon";

grant truncate on table "public"."type" to "anon";

grant update on table "public"."type" to "anon";

grant delete on table "public"."type" to "authenticated";

grant insert on table "public"."type" to "authenticated";

grant references on table "public"."type" to "authenticated";

grant select on table "public"."type" to "authenticated";

grant trigger on table "public"."type" to "authenticated";

grant truncate on table "public"."type" to "authenticated";

grant update on table "public"."type" to "authenticated";

grant delete on table "public"."type" to "service_role";

grant insert on table "public"."type" to "service_role";

grant references on table "public"."type" to "service_role";

grant select on table "public"."type" to "service_role";

grant trigger on table "public"."type" to "service_role";

grant truncate on table "public"."type" to "service_role";

grant update on table "public"."type" to "service_role";

grant delete on table "public"."type_relation" to "anon";

grant insert on table "public"."type_relation" to "anon";

grant references on table "public"."type_relation" to "anon";

grant select on table "public"."type_relation" to "anon";

grant trigger on table "public"."type_relation" to "anon";

grant truncate on table "public"."type_relation" to "anon";

grant update on table "public"."type_relation" to "anon";

grant delete on table "public"."type_relation" to "authenticated";

grant insert on table "public"."type_relation" to "authenticated";

grant references on table "public"."type_relation" to "authenticated";

grant select on table "public"."type_relation" to "authenticated";

grant trigger on table "public"."type_relation" to "authenticated";

grant truncate on table "public"."type_relation" to "authenticated";

grant update on table "public"."type_relation" to "authenticated";

grant delete on table "public"."type_relation" to "service_role";

grant insert on table "public"."type_relation" to "service_role";

grant references on table "public"."type_relation" to "service_role";

grant select on table "public"."type_relation" to "service_role";

grant trigger on table "public"."type_relation" to "service_role";

grant truncate on table "public"."type_relation" to "service_role";

grant update on table "public"."type_relation" to "service_role";

grant delete on table "public"."type_relation_type" to "anon";

grant insert on table "public"."type_relation_type" to "anon";

grant references on table "public"."type_relation_type" to "anon";

grant select on table "public"."type_relation_type" to "anon";

grant trigger on table "public"."type_relation_type" to "anon";

grant truncate on table "public"."type_relation_type" to "anon";

grant update on table "public"."type_relation_type" to "anon";

grant delete on table "public"."type_relation_type" to "authenticated";

grant insert on table "public"."type_relation_type" to "authenticated";

grant references on table "public"."type_relation_type" to "authenticated";

grant select on table "public"."type_relation_type" to "authenticated";

grant trigger on table "public"."type_relation_type" to "authenticated";

grant truncate on table "public"."type_relation_type" to "authenticated";

grant update on table "public"."type_relation_type" to "authenticated";

grant delete on table "public"."type_relation_type" to "service_role";

grant insert on table "public"."type_relation_type" to "service_role";

grant references on table "public"."type_relation_type" to "service_role";

grant select on table "public"."type_relation_type" to "service_role";

grant trigger on table "public"."type_relation_type" to "service_role";

grant truncate on table "public"."type_relation_type" to "service_role";

grant update on table "public"."type_relation_type" to "service_role";


