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
