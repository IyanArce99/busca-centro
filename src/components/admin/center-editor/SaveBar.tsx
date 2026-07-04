"use client";

import { CheckCircleIcon, ExclamationTriangleIcon } from "@/components/Icons";
import ActionButton from "../ActionButton";

export default function SaveBar({
  pending,
  message,
  onSave,
  saveLabel = "Guardar cambios",
}: {
  pending: boolean;
  message: { type: "ok" | "error"; text: string } | null;
  onSave: () => void;
  saveLabel?: string;
}) {
  return (
    <div className="flex items-center gap-3">
      <ActionButton variant="primary" onClick={onSave} disabled={pending}>
        {pending ? "Guardando..." : saveLabel}
      </ActionButton>
      {message ? (
        <span className={`flex items-center gap-1.5 text-sm ${message.type === "ok" ? "text-emerald-300" : "text-rose-300"}`}>
          {message.type === "ok" ? <CheckCircleIcon className="h-4 w-4" /> : <ExclamationTriangleIcon className="h-4 w-4" />}
          {message.text}
        </span>
      ) : null}
    </div>
  );
}
