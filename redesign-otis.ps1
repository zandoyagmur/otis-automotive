# ============================================================
# OTIS AUTOMOTIVE - Vintage Americana Redesign
# Run from C:\Users\Yagmur Zando\Desktop\otis-automotive
# ============================================================

Write-Host ""
Write-Host "Rebuilding Otis Automotive with Vintage Americana aesthetic..." -ForegroundColor Yellow
Write-Host ""

# Verify we're in the right place
if (-not (Test-Path "package.json")) {
    Write-Host "ERROR: Run this from inside the otis-automotive folder!" -ForegroundColor Red
    Write-Host "Try: cd C:\Users\Yagmur Zando\Desktop\otis-automotive" -ForegroundColor Yellow
    exit 1
}

# tailwind.config.ts - Vintage Americana palette
@'
import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        display: ["var(--font-display)", "serif"],
        sans: ["var(--font-sans)", "system-ui", "sans-serif"],
        mono: ["var(--font-mono)", "monospace"],
      },
      colors: {
        cream: {
          DEFAULT: "#F4EAD5",
          dark: "#E8D9B5",
          light: "#FBF5E5",
        },
        otis: {
          red: "#C8332B",
          "red-dark": "#9A2520",
          blue: "#1E3A8A",
          "blue-dark": "#172554",
          orange: "#E07A2D",
        },
        ink: {
          DEFAULT: "#2A1810",
          soft: "#4A2F22",
          mute: "#7A5A48",
        },
      },
    },
  },
  plugins: [],
};

export default config;
'@ | Set-Content -Path "tailwind.config.ts" -Encoding UTF8

# app/globals.css
@'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --cream: #F4EAD5;
  --cream-dark: #E8D9B5;
  --otis-red: #C8332B;
  --otis-blue: #1E3A8A;
  --ink: #2A1810;
}

* {
  -webkit-font-smoothing: antialiased;
}

html, body {
  background: var(--cream);
  color: var(--ink);
  font-family: var(--font-sans), system-ui, sans-serif;
}

/* Vintage paper texture - warm yellowed feel */
body::before {
  content: "";
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 1;
  opacity: 0.5;
  mix-blend-mode: multiply;
  background-image: url("data:image/svg+xml;utf8,<svg viewBox='0 0 400 400' xmlns='http://www.w3.org/2000/svg'><filter id='n'><feTurbulence type='fractalNoise' baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/><feColorMatrix values='0 0 0 0 0.16 0 0 0 0 0.09 0 0 0 0 0.06 0 0 0 0.08 0'/></filter><rect width='100%' height='100%' filter='url(%23n)'/></svg>");
}

/* Vintage paper edge effect on sections */
.paper-edge {
  position: relative;
}
.paper-edge::after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 8px;
  background: linear-gradient(180deg, transparent, rgba(42, 24, 16, 0.08));
}

::selection {
  background: var(--otis-red);
  color: var(--cream);
}

/* Vintage button - chunky, sharp corners */
.btn-vintage {
  background: var(--otis-red);
  color: var(--cream);
  padding: 1rem 2rem;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  font-size: 0.875rem;
  transition: all 0.15s;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  border: 3px solid var(--ink);
  box-shadow: 6px 6px 0 var(--ink);
}
.btn-vintage:hover {
  transform: translate(2px, 2px);
  box-shadow: 4px 4px 0 var(--ink);
}
.btn-vintage:active {
  transform: translate(6px, 6px);
  box-shadow: 0 0 0 var(--ink);
}

.btn-secondary {
  background: var(--cream);
  color: var(--ink);
  padding: 1rem 2rem;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  font-size: 0.875rem;
  border: 3px solid var(--ink);
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  transition: all 0.15s;
}
.btn-secondary:hover {
  background: var(--ink);
  color: var(--cream);
}

/* Vintage badge/seal */
.vintage-seal {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  border: 3px solid currentColor;
  border-radius: 50%;
  width: 120px;
  height: 120px;
  text-align: center;
  font-weight: 800;
  letter-spacing: 0.1em;
  position: relative;
}

/* Diagonal stripes for vintage feel */
.diagonal-stripes {
  background-image: repeating-linear-gradient(
    -45deg,
    var(--otis-red),
    var(--otis-red) 12px,
    var(--cream) 12px,
    var(--cream) 24px
  );
}
'@ | Set-Content -Path "app/globals.css" -Encoding UTF8

# app/layout.tsx
@'
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
'@ | Set-Content -Path "app/layout.tsx" -Encoding UTF8

# components/Nav.tsx
@'
"use client";

import { useState, useEffect } from "react";

export default function Nav() {
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handler = () => setScrolled(window.scrollY > 50);
    window.addEventListener("scroll", handler);
    return () => window.removeEventListener("scroll", handler);
  }, []);

  return (
    <header className={`fixed top-0 left-0 right-0 z-50 transition-all border-b-2 ${scrolled ? "bg-cream/95 backdrop-blur-sm py-3 border-ink" : "bg-transparent border-transparent py-4"}`}>
      <nav className="max-w-7xl mx-auto px-6 flex items-center justify-between">
        <a href="#top" className="flex items-center gap-3">
          <img
            src="/logo.png"
            alt="Otis Automotive"
            className={`transition-all ${scrolled ? "h-10" : "h-14"} w-auto object-contain`}
          />
        </a>
        <div className="hidden md:flex items-center gap-6 font-mono text-xs uppercase tracking-widest font-bold text-ink">
          <a href="#story" className="hover:text-otis-red transition-colors">Story</a>
          <a href="#services" className="hover:text-otis-red transition-colors">Services</a>
          <a href="#reviews" className="hover:text-otis-red transition-colors">Reviews</a>
          <a href="#schedule" className="hover:text-otis-red transition-colors">Schedule</a>
          <a href="#visit" className="hover:text-otis-red transition-colors">Visit</a>
          <a href="tel:+19169615058" className="bg-otis-red text-cream px-3 py-2 border-2 border-ink font-bold hover:bg-otis-red-dark transition-colors">
            (916) 961-5058
          </a>
        </div>
      </nav>
    </header>
  );
}
'@ | Set-Content -Path "components/Nav.tsx" -Encoding UTF8

# components/Hero.tsx
@'
export default function Hero() {
  return (
    <section id="top" className="relative min-h-screen flex items-center bg-cream overflow-hidden">
      {/* Decorative diagonal stripes top */}
      <div className="absolute top-0 left-0 right-0 h-3 diagonal-stripes opacity-90" />

      {/* Decorative blue arch background */}
      <div className="absolute top-1/2 right-0 -translate-y-1/2 w-[600px] h-[600px] bg-otis-blue/8 rounded-full blur-3xl" />
      <div className="absolute bottom-0 left-0 w-[400px] h-[400px] bg-otis-red/8 rounded-full blur-3xl" />

      <div className="relative z-10 max-w-7xl mx-auto px-6 pt-28 pb-16 grid grid-cols-1 lg:grid-cols-12 gap-8 items-center w-full">
        {/* Left: Text */}
        <div className="lg:col-span-7 lg:col-start-1">
          <div className="flex items-center gap-3 mb-6 font-mono text-xs uppercase tracking-widest font-bold">
            <span className="bg-ink text-cream px-2 py-1">EST. 1990</span>
            <span className="text-ink-mute">&middot;</span>
            <span className="text-ink">Lic. 211779</span>
            <span className="text-ink-mute">&middot;</span>
            <span className="text-otis-red">Fair Oaks, CA</span>
          </div>

          <h1 className="font-display text-6xl md:text-7xl lg:text-8xl leading-[0.9] mb-8 text-ink">
            <span className="block">HONEST</span>
            <span className="block text-otis-red">AUTO</span>
            <span className="block italic" style={{fontFamily: "var(--font-display)"}}>
              <span className="text-otis-blue">REPAIR.</span>
            </span>
          </h1>

          <p className="text-xl md:text-2xl text-ink-soft max-w-xl leading-relaxed mb-3 font-medium">
            Bruce Wiemer has been turning wrenches in Fair Oaks since the 1970s.
          </p>
          <p className="text-base text-ink-mute max-w-xl leading-relaxed mb-10 font-mono">
            We talk to you, not down to you. Honest pricing, quality work, no surprises.
          </p>

          <div className="flex flex-wrap items-center gap-5">
            <a href="#schedule" className="btn-vintage">
              Schedule Service
              <span>&rarr;</span>
            </a>
            <a href="tel:+19169615058" className="btn-secondary">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" strokeWidth={2.5} viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.95.68l1.5 4.49a1 1 0 01-.5 1.21l-2.26 1.13a11.04 11.04 0 005.52 5.52l1.13-2.26a1 1 0 011.21-.5l4.49 1.5a1 1 0 01.68.95V19a2 2 0 01-2 2h-1C9.72 21 3 14.28 3 6V5z" /></svg>
              (916) 961-5058
            </a>
          </div>
        </div>

        {/* Right: Vintage seal/badge */}
        <div className="lg:col-span-5 flex items-center justify-center">
          <div className="relative">
            {/* Outer rotating star ring */}
            <svg className="absolute inset-0 w-full h-full animate-[spin_60s_linear_infinite]" viewBox="0 0 400 400">
              <defs>
                <path id="circle" d="M 200, 200 m -160, 0 a 160,160 0 1,1 320,0 a 160,160 0 1,1 -320,0" />
              </defs>
              <text className="font-mono fill-ink" style={{fontSize: "20px", letterSpacing: "8px", fontWeight: "700"}}>
                <textPath href="#circle">
                  &middot; SERVING FAIR OAKS SINCE 1990 &middot; HONEST WORK &middot; FAIR PRICES &middot; FAMILY OWNED &middot;
                </textPath>
              </text>
            </svg>

            {/* Inner badge */}
            <div className="w-[280px] h-[280px] md:w-[340px] md:h-[340px] flex items-center justify-center">
              <div className="w-[200px] h-[200px] md:w-[240px] md:h-[240px] bg-otis-red border-4 border-ink rounded-full flex items-center justify-center text-cream relative">
                <div className="text-center">
                  <p className="font-display text-7xl leading-none">35</p>
                  <p className="font-mono text-xs uppercase tracking-widest font-bold mt-2">Years</p>
                  <div className="w-12 h-px bg-cream mx-auto my-3" />
                  <p className="font-mono text-[10px] uppercase tracking-widest font-bold">Fair Oaks Trusted</p>
                </div>
              </div>
            </div>

            {/* Stars decoration */}
            <div className="absolute -top-4 -right-4 flex gap-1">
              {[1,2,3,4,5].map(i => (
                <svg key={i} className="w-6 h-6 fill-otis-blue" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
              ))}
            </div>
            <div className="absolute -bottom-2 -left-2 bg-cream border-4 border-ink px-4 py-2 -rotate-6">
              <p className="font-display text-xl text-otis-red leading-none">4.9</p>
              <p className="font-mono text-[9px] uppercase tracking-widest font-bold text-ink mt-1">Google rated</p>
            </div>
          </div>
        </div>
      </div>

      {/* Bottom marquee */}
      <div className="absolute bottom-0 left-0 right-0 bg-ink text-cream py-3 overflow-hidden">
        <div className="flex gap-12 animate-[marquee_30s_linear_infinite] whitespace-nowrap font-mono text-xs uppercase tracking-widest font-bold">
          {Array(2).fill(0).map((_, idx) => (
            <div key={idx} className="flex gap-12 px-6">
              <span>OIL CHANGE</span><span>&middot;</span>
              <span>BRAKES</span><span>&middot;</span>
              <span>ENGINE DIAGNOSTIC</span><span>&middot;</span>
              <span>TRANSMISSION</span><span>&middot;</span>
              <span>TIRES &amp; ALIGNMENT</span><span>&middot;</span>
              <span>MAINTENANCE</span><span>&middot;</span>
              <span className="text-otis-orange">SINCE 1990</span><span>&middot;</span>
            </div>
          ))}
        </div>
      </div>

      <style>{`
        @keyframes marquee {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
      `}</style>
    </section>
  );
}
'@ | Set-Content -Path "components/Hero.tsx" -Encoding UTF8

# components/Story.tsx (replaces Team + WhyOtis)
@'
const milestones = [
  {
    year: "1970s",
    title: "Bruce starts wrenching",
    body: "A young Bruce Wiemer begins working on cars in Fair Oaks. He's been a fixture in the community ever since.",
  },
  {
    year: "1990",
    title: "Otis Automotive opens",
    body: "Bruce opens his own shop on Sacramento Street. With wife Laura by his side, the family-owned model is set from day one.",
  },
  {
    year: "2000s",
    title: "Trust gets passed down",
    body: "Customers from Elk Grove and South Sacramento drive in because their parents brought their cars here. Generations of trust, in motion.",
  },
  {
    year: "2017&ndash;2024",
    title: "Eight years, eight awards",
    body: "Voted Fair Oaks Neighborhood Favorite eight years running. Earned, not bought.",
  },
];

export default function Story() {
  return (
    <section id="story" className="bg-cream-dark py-24 px-6 relative overflow-hidden">
      {/* Background number */}
      <div className="absolute top-0 right-0 -translate-y-12 translate-x-12 font-display text-[400px] text-otis-red/5 leading-none select-none pointer-events-none">
        35
      </div>

      <div className="max-w-7xl mx-auto relative z-10">
        {/* Header */}
        <div className="grid grid-cols-1 md:grid-cols-12 gap-8 mb-20">
          <div className="md:col-span-4">
            <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-red mb-4">Chapter One</p>
            <div className="vintage-seal text-otis-blue">
              <span className="font-display text-2xl">EST.</span>
              <span className="font-display text-4xl leading-none">1990</span>
            </div>
          </div>
          <div className="md:col-span-8">
            <h2 className="font-display text-5xl md:text-7xl leading-[0.95] text-ink mb-6">
              THE OTIS<br />
              <span className="text-otis-red italic">STORY.</span>
            </h2>
            <p className="text-xl text-ink-soft leading-relaxed font-medium max-w-2xl">
              Three and a half decades of fixing cars the right way. No bait-and-switch, no upsells, no nonsense. Just a family-owned shop that's seen it all.
            </p>
          </div>
        </div>

        {/* Timeline */}
        <div className="relative">
          {/* Vertical line */}
          <div className="absolute left-[20px] md:left-1/2 md:-translate-x-1/2 top-0 bottom-0 w-1 bg-ink" />

          <div className="space-y-16">
            {milestones.map((m, i) => (
              <div key={m.year} className={`relative grid grid-cols-1 md:grid-cols-2 gap-8 items-center ${i % 2 === 0 ? "" : "md:[direction:rtl]"}`}>
                {/* Dot */}
                <div className="absolute left-[20px] md:left-1/2 md:-translate-x-1/2 w-6 h-6 bg-otis-red border-4 border-ink rounded-full z-10" />

                {/* Content */}
                <div className={`pl-16 md:pl-0 [direction:ltr] ${i % 2 === 0 ? "md:pr-16 md:text-right" : "md:pl-16 md:text-left"}`}>
                  <p className="font-display text-6xl md:text-7xl text-otis-blue mb-3 leading-none" dangerouslySetInnerHTML={{__html: m.year}} />
                  <h3 className="font-display text-2xl text-ink mb-3">{m.title.toUpperCase()}</h3>
                  <p className="text-ink-soft leading-relaxed">{m.body}</p>
                </div>

                {/* Empty side for alternating layout */}
                <div className="hidden md:block" />
              </div>
            ))}
          </div>
        </div>

        {/* Awards strip */}
        <div className="mt-24 bg-ink text-cream p-8 md:p-12 border-4 border-ink relative">
          <div className="absolute -top-4 -left-4 bg-otis-red text-cream px-4 py-2 border-4 border-ink font-mono text-xs uppercase tracking-widest font-bold">
            Awards
          </div>
          <h3 className="font-display text-3xl md:text-5xl tracking-wide leading-tight mb-6 mt-4">
            VOTED FAIR OAKS<br />NEIGHBORHOOD FAVORITE
          </h3>
          <div className="flex flex-wrap gap-3 mb-4">
            {["2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024"].map((year) => (
              <span key={year} className="px-4 py-2 border-2 border-otis-orange text-otis-orange font-mono text-sm font-bold">{year}</span>
            ))}
          </div>
          <p className="text-cream/60 text-sm font-mono italic">Eight years running on Nextdoor</p>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content -Path "components/Story.tsx" -Encoding UTF8

# components/Services.tsx - Vintage receipt style
@'
const services = [
  { num: "01", title: "Oil & Filter Change", desc: "Synthetic and conventional. Multi-point inspection included.", time: "30-45 min" },
  { num: "02", title: "Brake Service", desc: "Pads, rotors, fluid flush, full diagnostic on stopping system.", time: "1-3 hrs" },
  { num: "03", title: "Engine Diagnostic", desc: "Check engine light? We'll find the cause and explain it plainly.", time: "1 hr" },
  { num: "04", title: "Transmission", desc: "Fluid services, repairs, and replacements for all makes.", time: "Varies" },
  { num: "05", title: "Tires & Alignment", desc: "Mount, balance, rotate, and four-wheel alignment.", time: "1-2 hrs" },
  { num: "06", title: "General Maintenance", desc: "Tune-ups, belts, hoses, batteries, fluids, the works.", time: "Varies" },
];

export default function Services() {
  return (
    <section id="services" className="bg-cream py-24 px-6 relative">
      <div className="max-w-6xl mx-auto">
        {/* Header */}
        <div className="text-center mb-16">
          <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-red mb-4">Chapter Two</p>
          <h2 className="font-display text-5xl md:text-7xl leading-[0.95] text-ink mb-4">
            WHAT WE<br />
            <span className="text-otis-blue italic">WORK ON.</span>
          </h2>
        </div>

        {/* Receipt-style services list */}
        <div className="bg-cream-light border-4 border-ink p-8 md:p-12 max-w-4xl mx-auto relative">
          {/* Receipt header */}
          <div className="border-b-2 border-dashed border-ink pb-6 mb-6">
            <div className="flex justify-between items-baseline mb-2">
              <p className="font-display text-2xl text-ink">SERVICE MENU</p>
              <p className="font-mono text-xs text-ink-mute">No. 1990</p>
            </div>
            <p className="font-mono text-xs uppercase tracking-widest text-ink-mute">Otis Automotive &middot; 8019 Sacramento St &middot; Fair Oaks, CA</p>
          </div>

          {/* Services */}
          <div className="space-y-5">
            {services.map((s) => (
              <div key={s.num} className="flex items-start gap-6 border-b border-dotted border-ink/30 pb-5 last:border-0">
                <span className="font-display text-3xl text-otis-red flex-shrink-0 w-12">{s.num}</span>
                <div className="flex-1">
                  <div className="flex flex-col md:flex-row md:items-baseline md:justify-between gap-1 mb-2">
                    <h3 className="font-display text-xl text-ink">{s.title.toUpperCase()}</h3>
                    <span className="font-mono text-xs uppercase tracking-widest text-ink-mute">~ {s.time}</span>
                  </div>
                  <p className="text-ink-soft text-sm leading-relaxed">{s.desc}</p>
                </div>
              </div>
            ))}
          </div>

          {/* Receipt footer */}
          <div className="border-t-2 border-dashed border-ink mt-8 pt-6 flex flex-col md:flex-row md:justify-between md:items-center gap-4">
            <p className="font-mono text-sm text-ink">Don't see what you need?</p>
            <a href="tel:+19169615058" className="font-display text-2xl text-otis-red hover:text-otis-red-dark transition-colors">
              CALL (916) 961-5058
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content -Path "components/Services.tsx" -Encoding UTF8

# components/Reviews.tsx
@'
const reviews = [
  {
    body: "Only came in for a quick oil change but came out with a big smile. Bruce, Brian, and Thomas were all very thorough with my 35 year old Nissan. Kristine has to be the best front of house at an automotive shop I have ever met.",
    author: "Recent customer",
    source: "Google",
  },
  {
    body: "Probably the best I've ever seen and I've run two different automotive facilities. Professional, knowledgeable and most important — honest. My friend's whole family depends on them.",
    author: "Verified review",
    source: "Google",
  },
  {
    body: "Good vibes, no-nonsense shop. The kind of place where you actually talk with the tech. THAT's the kind of mechanic you want to have. One you can actually talk to.",
    author: "Local resident",
    source: "Google",
  },
  {
    body: "I love Otis Automotive. Small, personal business. They have saved me so much money! I bring all my family cars here.",
    author: "2018 Toyota RAV4 Owner",
    source: "CARFAX",
  },
];

export default function Reviews() {
  return (
    <section id="reviews" className="bg-otis-blue text-cream py-24 px-6 relative overflow-hidden">
      <div className="absolute top-0 left-0 right-0 h-3 diagonal-stripes" />

      <div className="max-w-6xl mx-auto relative z-10">
        {/* Header */}
        <div className="text-center mb-16">
          <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-orange mb-4">Chapter Three</p>
          <div className="flex items-center justify-center gap-2 mb-6">
            {[1,2,3,4,5].map(i => (
              <svg key={i} className="w-8 h-8 fill-otis-orange" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
            ))}
          </div>
          <h2 className="font-display text-5xl md:text-7xl leading-[0.95] mb-4">
            89 PEOPLE<br />
            <span className="text-otis-orange italic">CAN&apos;T BE WRONG.</span>
          </h2>
          <p className="text-cream/70 font-mono text-sm uppercase tracking-widest">4.9 average &middot; Google + CARFAX + Nextdoor</p>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-px bg-cream/20 mb-16 border-2 border-cream/30">
          {[
            { value: "4.9", label: "Stars" },
            { value: "89+", label: "Reviews" },
            { value: "35", label: "Years" },
            { value: "8x", label: "Award" },
          ].map((s) => (
            <div key={s.label} className="bg-otis-blue p-8 text-center">
              <p className="font-display text-5xl md:text-6xl text-otis-orange mb-2">{s.value}</p>
              <p className="font-mono text-xs uppercase tracking-widest font-bold text-cream/80">{s.label}</p>
            </div>
          ))}
        </div>

        {/* Reviews grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {reviews.map((review, i) => (
            <div key={i} className="bg-cream text-ink p-8 border-4 border-ink relative">
              <div className="absolute -top-3 -left-3 bg-otis-red text-cream w-12 h-12 flex items-center justify-center border-4 border-ink font-display text-xl">
                &ldquo;
              </div>
              <div className="flex items-center justify-between mb-4 mt-2">
                <div className="flex gap-1">
                  {[1,2,3,4,5].map(j => (
                    <svg key={j} className="w-4 h-4 fill-otis-red" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                  ))}
                </div>
                <span className="font-mono text-xs uppercase tracking-widest font-bold text-ink-mute">{review.source}</span>
              </div>
              <p className="text-ink leading-relaxed mb-4 font-medium">{review.body}</p>
              <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-red">— {review.author}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content -Path "components/Reviews.tsx" -Encoding UTF8

# components/ServiceForm.tsx - Vintage form style
@'
"use client";

import { useState } from "react";

export default function ServiceForm() {
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitted(true);
  };

  if (submitted) {
    return (
      <section id="schedule" className="bg-cream py-24 px-6">
        <div className="max-w-3xl mx-auto text-center">
          <div className="inline-flex items-center justify-center w-20 h-20 bg-otis-red border-4 border-ink mb-8">
            <svg className="w-10 h-10 text-cream" fill="none" stroke="currentColor" strokeWidth={3} viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" /></svg>
          </div>
          <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-red mb-4">Request Received</p>
          <h2 className="font-display text-5xl md:text-6xl mb-4 text-ink leading-tight">THANKS FOR<br /><span className="text-otis-blue italic">REACHING OUT.</span></h2>
          <p className="text-lg text-ink-soft">Kristine will call you within 24 hours to confirm your appointment.</p>
        </div>
      </section>
    );
  }

  return (
    <section id="schedule" className="bg-cream py-24 px-6 relative">
      <div className="max-w-6xl mx-auto">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
          {/* Left: Title */}
          <div className="lg:col-span-5">
            <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-red mb-4">Chapter Four</p>
            <h2 className="font-display text-5xl md:text-6xl leading-[0.95] text-ink mb-6">
              SCHEDULE<br />
              <span className="text-otis-red italic">SERVICE.</span>
            </h2>
            <p className="text-lg text-ink-soft leading-relaxed mb-6 max-w-md">
              Tell us about your vehicle and what's going on. Kristine will get back to you within 24 hours with a time and ballpark estimate.
            </p>
            <div className="bg-ink text-cream p-6 border-4 border-ink">
              <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-orange mb-2">Walk-ins welcome</p>
              <p className="font-display text-xl mb-1">8019 SACRAMENTO ST</p>
              <p className="font-mono text-sm text-cream/70">Mon&ndash;Fri &middot; 8AM&ndash;4:30PM</p>
            </div>
          </div>

          {/* Right: Form */}
          <form onSubmit={handleSubmit} className="lg:col-span-7 bg-cream-light p-8 md:p-10 border-4 border-ink space-y-5">
            <div className="border-b-2 border-dashed border-ink pb-4 mb-6">
              <div className="flex justify-between items-baseline">
                <p className="font-display text-2xl text-ink">SERVICE REQUEST</p>
                <p className="font-mono text-xs text-ink-mute">No. _______</p>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <label className="block">
                <span className="font-mono text-xs uppercase tracking-widest font-bold text-ink mb-1 block">Name *</span>
                <input required className="w-full px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors" />
              </label>
              <label className="block">
                <span className="font-mono text-xs uppercase tracking-widest font-bold text-ink mb-1 block">Phone *</span>
                <input required className="w-full px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors" />
              </label>
            </div>

            <label className="block">
              <span className="font-mono text-xs uppercase tracking-widest font-bold text-ink mb-1 block">Email (optional)</span>
              <input className="w-full px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors" />
            </label>

            <div>
              <p className="font-mono text-xs uppercase tracking-widest font-bold text-ink mb-1">Vehicle *</p>
              <div className="grid grid-cols-3 gap-4">
                <input required placeholder="Year" className="px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors" />
                <input required placeholder="Make" className="px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors" />
                <input required placeholder="Model" className="px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors" />
              </div>
            </div>

            <label className="block">
              <span className="font-mono text-xs uppercase tracking-widest font-bold text-ink mb-1 block">Service needed *</span>
              <select required className="w-full px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors">
                <option value="">Choose one&hellip;</option>
                <option>Oil &amp; filter change</option>
                <option>Brake service</option>
                <option>Engine diagnostic</option>
                <option>Transmission</option>
                <option>Tires &amp; alignment</option>
                <option>General maintenance</option>
                <option>Not sure - need diagnosis</option>
              </select>
            </label>

            <label className="block">
              <span className="font-mono text-xs uppercase tracking-widest font-bold text-ink mb-1 block">Notes (optional)</span>
              <textarea rows={3} className="w-full px-3 py-3 bg-cream border-2 border-ink focus:border-otis-red outline-none transition-colors resize-none" />
            </label>

            <button type="submit" className="btn-vintage w-full justify-center text-base py-4">
              Send Request &rarr;
            </button>
            <p className="font-mono text-xs text-ink-mute text-center">No payment info needed. Kristine will call to confirm.</p>
          </form>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content -Path "components/ServiceForm.tsx" -Encoding UTF8

# components/Visit.tsx
@'
export default function Visit() {
  return (
    <section id="visit" className="bg-cream-dark py-24 px-6 relative">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-red mb-4">Chapter Five</p>
          <h2 className="font-display text-5xl md:text-7xl leading-[0.95] text-ink mb-4">
            VISIT<br />
            <span className="text-otis-blue italic">THE SHOP.</span>
          </h2>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-stretch">
          {/* Left: Info card */}
          <div className="bg-cream border-4 border-ink p-8 md:p-10 flex flex-col justify-between">
            <div>
              <div className="border-b-2 border-dashed border-ink pb-6 mb-6">
                <p className="font-mono text-xs uppercase tracking-widest font-bold text-ink-mute mb-2">Address</p>
                <p className="font-display text-3xl md:text-4xl text-ink leading-tight">8019 SACRAMENTO ST</p>
                <p className="font-mono text-sm text-ink-soft mt-1">Fair Oaks, California 95628</p>
              </div>

              <div className="border-b-2 border-dashed border-ink pb-6 mb-6">
                <p className="font-mono text-xs uppercase tracking-widest font-bold text-ink-mute mb-2">Phone</p>
                <a href="tel:+19169615058" className="font-display text-3xl text-otis-red hover:text-otis-red-dark transition-colors">
                  (916) 961-5058
                </a>
              </div>

              <div>
                <p className="font-mono text-xs uppercase tracking-widest font-bold text-ink-mute mb-3">Hours</p>
                <div className="font-mono text-sm space-y-2">
                  <div className="flex justify-between border-b border-dotted border-ink/30 pb-2">
                    <span className="font-bold">Mon &ndash; Fri</span>
                    <span>8:00 AM &ndash; 4:30 PM</span>
                  </div>
                  <div className="flex justify-between text-ink-mute">
                    <span className="font-bold">Sat &ndash; Sun</span>
                    <span>Closed</span>
                  </div>
                </div>
              </div>
            </div>

            <a href="https://www.google.com/maps/search/?api=1&query=8019+Sacramento+St+Fair+Oaks+CA" target="_blank" rel="noopener noreferrer" className="btn-vintage w-full justify-center mt-8">
              Get Directions &rarr;
            </a>
          </div>

          {/* Right: Map */}
          <div className="border-4 border-ink overflow-hidden bg-cream min-h-[400px]">
            <iframe
              src="https://maps.google.com/maps?q=8019+Sacramento+St+Fair+Oaks+CA&t=&z=15&ie=UTF8&iwloc=&output=embed"
              width="100%"
              height="100%"
              style={{ border: 0, minHeight: 400, filter: "sepia(0.3) contrast(1.05)" }}
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
            />
          </div>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content -Path "components/Visit.tsx" -Encoding UTF8

# components/Footer.tsx
@'
export default function Footer() {
  return (
    <footer className="bg-ink text-cream pt-12 pb-8 px-6 relative">
      <div className="absolute top-0 left-0 right-0 h-3 diagonal-stripes" />

      <div className="max-w-7xl mx-auto pt-6">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12 pb-12 border-b border-cream/20">
          <div>
            <img src="/logo.png" alt="Otis Automotive" className="h-16 w-auto object-contain mb-4 brightness-0 invert" />
            <p className="font-mono text-sm text-cream/70 leading-relaxed">
              Honest auto repair in Fair Oaks since 1990. Family-owned, four-generation trusted.
            </p>
          </div>

          <div>
            <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-orange mb-4">Visit</p>
            <p className="text-cream/80 mb-1">8019 Sacramento St</p>
            <p className="text-cream/80 mb-3">Fair Oaks, CA 95628</p>
            <p className="font-mono text-xs text-cream/60">Mon &ndash; Fri &middot; 8AM &ndash; 4:30PM</p>
          </div>

          <div>
            <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-orange mb-4">Contact</p>
            <a href="tel:+19169615058" className="font-display text-2xl text-cream hover:text-otis-orange transition-colors block mb-2">
              (916) 961-5058
            </a>
            <p className="font-mono text-xs text-cream/60">Lic. 211779</p>
          </div>
        </div>

        <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
          <p className="font-mono text-xs text-cream/40">
            &copy; {new Date().getFullYear()} Otis Automotive. All rights reserved.
          </p>
          <p className="font-mono text-xs text-cream/40">
            Site design by <a href="https://yagmurzando.com" className="text-otis-orange hover:underline">Yagmur Zando</a>
          </p>
        </div>
      </div>
    </footer>
  );
}
'@ | Set-Content -Path "components/Footer.tsx" -Encoding UTF8

# app/page.tsx - new structure
@'
import Nav from "@/components/Nav";
import Hero from "@/components/Hero";
import Story from "@/components/Story";
import Services from "@/components/Services";
import Reviews from "@/components/Reviews";
import ServiceForm from "@/components/ServiceForm";
import Visit from "@/components/Visit";
import Footer from "@/components/Footer";

export default function Home() {
  return (
    <>
      <Nav />
      <Hero />
      <Story />
      <Services />
      <Reviews />
      <ServiceForm />
      <Visit />
      <Footer />
    </>
  );
}
'@ | Set-Content -Path "app/page.tsx" -Encoding UTF8

# Remove old unused components
if (Test-Path "components/Team.tsx") { Remove-Item "components/Team.tsx" -Force }
if (Test-Path "components/WhyOtis.tsx") { Remove-Item "components/WhyOtis.tsx" -Force }

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  VINTAGE AMERICANA REDESIGN COMPLETE" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Run: npm run dev" -ForegroundColor Yellow
Write-Host "Then open: http://localhost:3000" -ForegroundColor Yellow
Write-Host ""
