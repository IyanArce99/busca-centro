export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[];

export interface Database {
  public: {
    Tables: {
      cities: {
        Row: {
          id: string;
          slug: string;
          name: string;
          province: string;
          region: string;
          is_featured: boolean;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          slug: string;
          name: string;
          province: string;
          region: string;
          is_featured?: boolean;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          slug?: string;
          name?: string;
          province?: string;
          region?: string;
          is_featured?: boolean;
          created_at?: string;
          updated_at?: string;
        };
        Relationships: [];
      };

      centers: {
        Row: {
          id: string;
          slug: string;
          name: string;
          type: string;
          ownership: string;
          street: string | null;
          postal_code: string | null;
          city_slug: string;
          city_name: string;
          neighborhood: string | null;
          district: string | null;
          neighborhood_barrio: string | null;
          latitude: number | null;
          longitude: number | null;
          phone: string | null;
          email: string | null;
          website: string | null;
          age_min_months: number;
          age_max_months: number;
          schedule: string | null;
          services: string[];
          short_description: string;
          long_description: string | null;
          images: string[];
          faqs: Json;
          is_claimed: boolean;
          is_verified: boolean;
          social_links: Json;
          pedagogical_approach: string[];
          source_url: string | null;
          source_urls_secondary: string[];
          verified_at: string | null;
          verification_status: string;
          confidence_level: string;
          data_conflicts: Json;
          status: string;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          slug: string;
          name: string;
          type: string;
          ownership: string;
          street?: string | null;
          postal_code?: string | null;
          city_slug: string;
          city_name: string;
          neighborhood?: string | null;
          district?: string | null;
          neighborhood_barrio?: string | null;
          latitude?: number | null;
          longitude?: number | null;
          phone?: string | null;
          email?: string | null;
          website?: string | null;
          age_min_months?: number;
          age_max_months?: number;
          schedule?: string | null;
          services?: string[];
          short_description?: string;
          long_description?: string | null;
          images?: string[];
          faqs?: Json;
          is_claimed?: boolean;
          is_verified?: boolean;
          social_links?: Json;
          pedagogical_approach?: string[];
          source_url?: string | null;
          source_urls_secondary?: string[];
          verified_at?: string | null;
          verification_status?: string;
          confidence_level?: string;
          data_conflicts?: Json;
          status?: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          slug?: string;
          name?: string;
          type?: string;
          ownership?: string;
          street?: string | null;
          postal_code?: string | null;
          city_slug?: string;
          city_name?: string;
          neighborhood?: string | null;
          district?: string | null;
          neighborhood_barrio?: string | null;
          latitude?: number | null;
          longitude?: number | null;
          phone?: string | null;
          email?: string | null;
          website?: string | null;
          age_min_months?: number;
          age_max_months?: number;
          schedule?: string | null;
          services?: string[];
          short_description?: string;
          long_description?: string | null;
          images?: string[];
          faqs?: Json;
          is_claimed?: boolean;
          is_verified?: boolean;
          social_links?: Json;
          pedagogical_approach?: string[];
          source_url?: string | null;
          source_urls_secondary?: string[];
          verified_at?: string | null;
          verification_status?: string;
          confidence_level?: string;
          data_conflicts?: Json;
          status?: string;
          created_at?: string;
          updated_at?: string;
        };
        Relationships: [];
      };

      seo_pages: {
        Row: {
          id: string;
          slug: string;
          title: string;
          h1: string;
          subtitle: string;
          meta_description: string;
          city_slug: string;
          center_type: string;
          service: string | null;
          ownership: string | null;
          intro_text: string;
          outro_text: string;
          faqs: Json;
          status: string;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          slug: string;
          title: string;
          h1: string;
          subtitle: string;
          meta_description: string;
          city_slug: string;
          center_type: string;
          service?: string | null;
          ownership?: string | null;
          intro_text?: string;
          outro_text?: string;
          faqs?: Json;
          status?: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          slug?: string;
          title?: string;
          h1?: string;
          subtitle?: string;
          meta_description?: string;
          city_slug?: string;
          center_type?: string;
          service?: string | null;
          ownership?: string | null;
          intro_text?: string;
          outro_text?: string;
          faqs?: Json;
          status?: string;
          created_at?: string;
          updated_at?: string;
        };
        Relationships: [];
      };

      guides: {
        Row: {
          id: string;
          slug: string;
          title: string;
          excerpt: string;
          content: Json;
          category: string;
          reading_time_minutes: number;
          status: string;
          published_at: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          slug: string;
          title: string;
          excerpt: string;
          content?: Json;
          category: string;
          reading_time_minutes?: number;
          status?: string;
          published_at?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          slug?: string;
          title?: string;
          excerpt?: string;
          content?: Json;
          category?: string;
          reading_time_minutes?: number;
          status?: string;
          published_at?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Relationships: [];
      };

      faqs: {
        Row: {
          id: string;
          question: string;
          answer: string;
          context: string | null;
          display_order: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          question: string;
          answer: string;
          context?: string | null;
          display_order?: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          question?: string;
          answer?: string;
          context?: string | null;
          display_order?: number;
          created_at?: string;
        };
        Relationships: [];
      };

      leads: {
        Row: {
          id: string;
          center_slug: string;
          name: string;
          email: string;
          phone: string | null;
          message: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          center_slug: string;
          name: string;
          email: string;
          phone?: string | null;
          message?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          center_slug?: string;
          name?: string;
          email?: string;
          phone?: string | null;
          message?: string | null;
          created_at?: string;
        };
        Relationships: [];
      };

      center_claims: {
        Row: {
          id: string;
          center_name: string;
          center_url: string;
          applicant_name: string;
          applicant_role: string;
          corporate_email: string;
          phone: string | null;
          website: string | null;
          comments: string | null;
          status: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          center_name: string;
          center_url: string;
          applicant_name: string;
          applicant_role: string;
          corporate_email: string;
          phone?: string | null;
          website?: string | null;
          comments?: string | null;
          status?: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          center_name?: string;
          center_url?: string;
          applicant_name?: string;
          applicant_role?: string;
          corporate_email?: string;
          phone?: string | null;
          website?: string | null;
          comments?: string | null;
          status?: string;
          created_at?: string;
        };
        Relationships: [];
      };

      center_submissions: {
        Row: {
          id: string;
          name: string;
          city: string;
          address: string;
          contact_name: string;
          email: string;
          phone: string | null;
          website: string | null;
          center_type: string | null;
          age_range: string | null;
          services: string | null;
          comments: string | null;
          status: string;
          created_at: string;
        };
        Insert: {
          id?: string;
          name: string;
          city: string;
          address: string;
          contact_name: string;
          email: string;
          phone?: string | null;
          website?: string | null;
          center_type?: string | null;
          age_range?: string | null;
          services?: string | null;
          comments?: string | null;
          status?: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          name?: string;
          city?: string;
          address?: string;
          contact_name?: string;
          email?: string;
          phone?: string | null;
          website?: string | null;
          center_type?: string | null;
          age_range?: string | null;
          services?: string | null;
          comments?: string | null;
          status?: string;
          created_at?: string;
        };
        Relationships: [];
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      [_ in never]: never;
    };
    Enums: {
      [_ in never]: never;
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
}
