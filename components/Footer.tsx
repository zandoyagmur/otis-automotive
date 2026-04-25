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
