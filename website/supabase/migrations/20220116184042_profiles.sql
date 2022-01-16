create table if not exists profiles (
    id uuid primary key default gen_random_uuid(),
    created_at timestamptz not null default timezone('utc'::text, now()),
    updated_at timestamptz not null default timezone('utc'::text, now()),
    username text not null unique,
    first_name text,
    last_name text,

    constraint valid_username check (
        char_length(username) >= 3 and 
        char_length(username) <= 35
    ),
    constraint valid_first_name check (
        char_length(first_name) >= 3 and 
        char_length(first_name) <= 35
    ),
    constraint valid_last_name check (
        char_length(last_name) >= 3 and 
        char_length(last_name) <= 35
    )
);

create or replace function public.handle_new_user() 
returns trigger 
language plpgsql 
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, username)
  values (new.id, new.raw_user_meta_data ->> 'username'  );
  return new;
end;
$$;

create or replace trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();