"use server";

import { redirect } from "next/navigation";
import { getAuthServerClient } from "@/lib/supabase/auth-server";
import { isAdminEmail } from "@/lib/admin/auth";

export interface LoginState {
  error: string | null;
}

export async function loginAction(_prev: LoginState, formData: FormData): Promise<LoginState> {
  const email = String(formData.get("email") ?? "").trim();
  const password = String(formData.get("password") ?? "");

  if (!email || !password) {
    return { error: "Introduce email y contraseña." };
  }

  const supabase = await getAuthServerClient();
  const { data, error } = await supabase.auth.signInWithPassword({ email, password });

  if (error || !data.user) {
    return { error: "Credenciales incorrectas." };
  }

  if (!isAdminEmail(data.user.email)) {
    await supabase.auth.signOut();
    return { error: "Esta cuenta no tiene acceso al panel de administración." };
  }

  redirect("/admin");
}

export async function logoutAction(): Promise<void> {
  const supabase = await getAuthServerClient();
  await supabase.auth.signOut();
  redirect("/admin/login");
}
