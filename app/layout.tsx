import type { Metadata } from "next";
import { Bowlby_One, IBM_Plex_Mono, IBM_Plex_Sans } from "next/font/google";
import "./globals.css";

const bowlby = Bowlby_One({
  weight: "400",
  subsets: ["latin"],
  variable: "--font-display",
  display: "swap",
});

const ibmMono = IBM_Plex_Mono({
  weight: ["400", "500", "600", "700"],
  subsets: ["latin"],
  variable: "--font-mono",
  display: "swap",
});

const ibmSans = IBM_Plex_Sans({
  weight: ["400", "500", "600", "700"],
  subsets: ["latin"],
  variable: "--font-sans",
  display: "swap",
});

export const metadata: Metadata = {
  title: "Otis Automotive - Honest Auto Repair in Fair Oaks Since 1990",
  description: "Family-owned auto repair shop in Fair Oaks, CA. Bruce Wiemer has been working on cars in Fair Oaks since the 1970s. 4.9 stars on Google. Voted Neighborhood Favorite 8 years running.",
  robots: {
    index: false,
    follow: false,
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${bowlby.variable} ${ibmMono.variable} ${ibmSans.variable}`}>
      <body className="relative z-0 font-sans">
        <main className="relative z-10">{children}</main>
      </body>
    </html>
  );
}
