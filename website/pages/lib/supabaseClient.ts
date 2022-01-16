import { createClient, SupabaseClient } from "@supabase/supabase-js";

let supabaseSingleton: null | SupabaseClient = null;

const SUPABASE_URL = "http://localhost:54321";
const SUPABASE_KEY_ANON =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiJ9.ZopqoUt20nEV9cklpv9e3yw3PVyZLmKs5qLD6nGL1SI";

if (supabaseSingleton === null) {
  supabaseSingleton = createClient(SUPABASE_URL, SUPABASE_KEY_ANON);
}

const supabase = supabaseSingleton as SupabaseClient;

export { supabase };
