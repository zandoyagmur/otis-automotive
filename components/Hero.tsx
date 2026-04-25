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
