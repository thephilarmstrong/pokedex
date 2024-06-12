create table "public"."egg_group" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null
);


alter table "public"."egg_group" enable row level security;

CREATE UNIQUE INDEX egg_group_name_key ON public.egg_group USING btree (name);

CREATE UNIQUE INDEX egg_group_pkey ON public.egg_group USING btree (id);

alter table "public"."egg_group" add constraint "egg_group_pkey" PRIMARY KEY using index "egg_group_pkey";

alter table "public"."egg_group" add constraint "egg_group_name_key" UNIQUE using index "egg_group_name_key";

grant delete on table "public"."egg_group" to "anon";

grant insert on table "public"."egg_group" to "anon";

grant references on table "public"."egg_group" to "anon";

grant select on table "public"."egg_group" to "anon";

grant trigger on table "public"."egg_group" to "anon";

grant truncate on table "public"."egg_group" to "anon";

grant update on table "public"."egg_group" to "anon";

grant delete on table "public"."egg_group" to "authenticated";

grant insert on table "public"."egg_group" to "authenticated";

grant references on table "public"."egg_group" to "authenticated";

grant select on table "public"."egg_group" to "authenticated";

grant trigger on table "public"."egg_group" to "authenticated";

grant truncate on table "public"."egg_group" to "authenticated";

grant update on table "public"."egg_group" to "authenticated";

grant delete on table "public"."egg_group" to "service_role";

grant insert on table "public"."egg_group" to "service_role";

grant references on table "public"."egg_group" to "service_role";

grant select on table "public"."egg_group" to "service_role";

grant trigger on table "public"."egg_group" to "service_role";

grant truncate on table "public"."egg_group" to "service_role";

grant update on table "public"."egg_group" to "service_role";


