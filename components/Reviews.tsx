const reviews = [
  {
    body: "Only came in for a quick oil change but came out with a big smile. Bruce, Brian, and Thomas were all very thorough with my 35 year old Nissan. Kristine has to be the best front of house at an automotive shop I have ever met.",
    author: "Recent customer",
    source: "Google",
  },
  {
    body: "Probably the best I've ever seen and I've run two different automotive facilities. Professional, knowledgeable and most important â€” honest. My friend's whole family depends on them.",
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
              <p className="font-mono text-xs uppercase tracking-widest font-bold text-otis-red">â€” {review.author}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
