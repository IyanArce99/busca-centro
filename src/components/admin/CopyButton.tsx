"use client";

export default function CopyButton({ value, label }: { value: string; label: string }) {
  return (
    <button type="button" onClick={() => navigator.clipboard.writeText(value)} className="text-cyan-300 transition hover:text-cyan-200 hover:underline">
      {label}
    </button>
  );
}
