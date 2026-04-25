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
