import { notFound } from "next/navigation";
import { getCenterByIdAdmin } from "@/lib/admin/data";
import CenterEditorHeader from "@/components/admin/center-editor/CenterEditorHeader";
import CenterEditorTabs from "@/components/admin/center-editor/CenterEditorTabs";
import CenterSidebar from "@/components/admin/center-editor/CenterSidebar";

interface PageProps {
  params: Promise<{ id: string }>;
}

export default async function AdminCenterDetailPage({ params }: PageProps) {
  const { id } = await params;
  const center = await getCenterByIdAdmin(id);
  if (!center) notFound();

  return (
    <div className="flex flex-col gap-5">
      <CenterEditorHeader center={center} />

      <div className="grid grid-cols-1 gap-5 xl:grid-cols-[minmax(0,1fr)_320px]">
        <div className="min-w-0">
          <CenterEditorTabs center={center} />
        </div>
        <div className="order-first xl:order-last xl:sticky xl:top-6 xl:self-start">
          <CenterSidebar center={center} />
        </div>
      </div>
    </div>
  );
}
