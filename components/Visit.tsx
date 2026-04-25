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
