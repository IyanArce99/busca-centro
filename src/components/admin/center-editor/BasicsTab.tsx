"use client";

import { useState, useTransition } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import { updateCenterBasics } from "@/lib/admin/actions";
import SaveBar from "./SaveBar";
import AdminSectionCard from "../AdminSectionCard";
import { AdminInput, AdminSelect } from "../AdminInput";
import { ExclamationTriangleIcon } from "@/components/Icons";

export default function BasicsTab({ center }: { center: AdminCenter }) {
  const [form, setForm] = useState({
    name: center.name,
    slug: center.slug,
    type: center.type,
    ownership: center.ownership,
    cityName: center.city_name,
    citySlug: center.city_slug,
    district: center.district ?? "",
    neighborhoodBarrio: center.neighborhood_barrio ?? "",
    street: center.street ?? "",
    postalCode: center.postal_code ?? "",
    latitude: center.latitude != null ? String(center.latitude) : "",
    longitude: center.longitude != null ? String(center.longitude) : "",
    phone: center.phone ?? "",
    email: center.email ?? "",
    website: center.website ?? "",
    instagram: (center.social_links as { instagram?: string } | null)?.instagram ?? "",
    facebook: (center.social_links as { facebook?: string } | null)?.facebook ?? "",
    linkedin: (center.social_links as { linkedin?: string } | null)?.linkedin ?? "",
  });
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<{ type: "ok" | "error"; text: string } | null>(null);

  const sensitiveChanged =
    form.slug !== center.slug || form.name !== center.name || form.street !== (center.street ?? "") || form.phone !== (center.phone ?? "") || form.website !== (center.website ?? "");

  const set = (key: keyof typeof form) => (e: React.ChangeEvent<HTMLInputElement>) => setForm((f) => ({ ...f, [key]: e.target.value }));

  const save = () => {
    startTransition(async () => {
      const res = await updateCenterBasics(center.id, {
        ...form,
        socialLinks: { instagram: form.instagram || undefined, facebook: form.facebook || undefined, linkedin: form.linkedin || undefined },
      });
      setMsg(res.ok ? { type: "ok", text: "Guardado." } : { type: "error", text: res.error ?? "Error al guardar." });
    });
  };

  return (
    <div className="flex flex-col gap-5">
      {sensitiveChanged ? (
        <div className="flex items-start gap-2.5 rounded-xl border border-amber-400/20 bg-amber-500/[0.07] px-4 py-3 text-sm text-amber-200">
          <ExclamationTriangleIcon className="mt-0.5 h-4 w-4 shrink-0 text-amber-400" />
          <span>Vas a cambiar nombre, slug, calle, teléfono o web. El slug cambia la URL pública (/centro/{form.slug}) — revisa que no rompa enlaces existentes.</span>
        </div>
      ) : null}

      <AdminSectionCard title="Identidad" description="Nombre, slug y clasificación del centro">
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <AdminInput label="Nombre" value={form.name} onChange={set("name")} />
          <AdminInput label="Slug" value={form.slug} onChange={set("slug")} />
          <AdminSelect
            label="Tipo"
            value={form.type}
            onChange={(v) => setForm((f) => ({ ...f, type: v }))}
            options={[
              ["guarderia", "Guardería"],
              ["escuela-infantil", "Escuela infantil"],
            ]}
          />
          <AdminSelect
            label="Titularidad"
            value={form.ownership}
            onChange={(v) => setForm((f) => ({ ...f, ownership: v }))}
            options={[
              ["publico", "Público"],
              ["privado", "Privado"],
              ["concertado", "Concertado"],
            ]}
          />
        </div>
      </AdminSectionCard>

      <AdminSectionCard title="Ubicación" description="Dirección y coordenadas del centro">
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <AdminInput label="Ciudad (nombre)" value={form.cityName} onChange={set("cityName")} />
          <AdminInput label="Ciudad (slug)" value={form.citySlug} onChange={set("citySlug")} />
          <AdminInput label="Distrito" value={form.district} onChange={set("district")} />
          <AdminInput label="Barrio" value={form.neighborhoodBarrio} onChange={set("neighborhoodBarrio")} />
          <AdminInput label="Calle" value={form.street} onChange={set("street")} wrapperClassName="sm:col-span-2" />
          <AdminInput label="Código postal" value={form.postalCode} onChange={set("postalCode")} />
          <div className="grid grid-cols-2 gap-4">
            <AdminInput label="Latitud" value={form.latitude} onChange={set("latitude")} />
            <AdminInput label="Longitud" value={form.longitude} onChange={set("longitude")} />
          </div>
        </div>
      </AdminSectionCard>

      <AdminSectionCard title="Contacto" description="Datos de contacto y redes sociales">
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <AdminInput label="Teléfono" value={form.phone} onChange={set("phone")} />
          <AdminInput label="Email" type="email" value={form.email} onChange={set("email")} />
          <AdminInput label="Web" value={form.website} onChange={set("website")} wrapperClassName="sm:col-span-2" />
          <AdminInput label="Instagram" value={form.instagram} onChange={set("instagram")} />
          <AdminInput label="Facebook" value={form.facebook} onChange={set("facebook")} />
          <AdminInput label="LinkedIn" value={form.linkedin} onChange={set("linkedin")} />
        </div>
      </AdminSectionCard>

      <SaveBar pending={pending} message={msg} onSave={save} />
    </div>
  );
}
