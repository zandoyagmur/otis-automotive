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
