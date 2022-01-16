import { createClient, SupabaseClient } from "@supabase/supabase-js";

let supabaseSingleton: null | SupabaseClient = null;

const SUPABASE_URL = process.env.SUPABASE_URL || "http://localhost:54321";
const SUPABASE_KEY_ANON = process.env.SUPABASE_KEY_ANON || "";

if (supabaseSingleton === null) {
  supabaseSingleton = createClient(SUPABASE_URL, SUPABASE_KEY_ANON);
}

const supabase = supabaseSingleton as SupabaseClient;

export { supabase };
