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
    body: "Good vibes, no&mdash;nonsense shop. The kind of place where you actually talk with the tech. THAT's the kind of mechanic you want to have. One you can actually talk to.",
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
    <section id="reviews" className="bg&mdash;otis&mdash;blue text&mdash;cream py&mdash;24 px&mdash;6 relative overflow&mdash;hidden">
      <div className="absolute top&mdash;0 left&mdash;0 right&mdash;0 h&mdash;3 diagonal&mdash;stripes" />

      <div className="max&mdash;w&mdash;6xl mx&mdash;auto relative z&mdash;10">
        {/* Header */}
        <div className="text&mdash;center mb&mdash;16">
          <p className="font&mdash;mono text&mdash;xs uppercase tracking&mdash;widest font&mdash;bold text&mdash;otis&mdash;orange mb&mdash;4">Chapter Three</p>
          <div className="flex items&mdash;center justify&mdash;center gap&mdash;2 mb&mdash;6">
            {[1,2,3,4,5].map(i => (
              <svg key={i} className="w&mdash;8 h&mdash;8 fill&mdash;otis&mdash;orange" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l&mdash;5 4.87 1.18 6.88L12 17.77l&mdash;6.18 3.25L7 14.14 2 9.27l6.91&mdash;1.01L12 2z"/></svg>
            ))}
          </div>
          <h2 className="font&mdash;display text&mdash;5xl md:text&mdash;7xl leading&mdash;[0.95] mb&mdash;4">
            89 PEOPLE<br />
            <span className="text&mdash;otis&mdash;orange italic">CAN&apos;T BE WRONG.</span>
          </h2>
          <p className="text&mdash;cream/70 font&mdash;mono text&mdash;sm uppercase tracking&mdash;widest">4.9 average &middot; Google + CARFAX + Nextdoor</p>
        </div>

        {/* Stats */}
        <div className="grid grid&mdash;cols&mdash;2 md:grid&mdash;cols&mdash;4 gap&mdash;px bg&mdash;cream/20 mb&mdash;16 border&mdash;2 border&mdash;cream/30">
          {[
            { value: "4.9", label: "Stars" },
            { value: "89+", label: "Reviews" },
            { value: "35", label: "Years" },
            { value: "8x", label: "Award" },
          ].map((s) => (
            <div key={s.label} className="bg&mdash;otis&mdash;blue p&mdash;8 text&mdash;center">
              <p className="font&mdash;display text&mdash;5xl md:text&mdash;6xl text&mdash;otis&mdash;orange mb&mdash;2">{s.value}</p>
              <p className="font&mdash;mono text&mdash;xs uppercase tracking&mdash;widest font&mdash;bold text&mdash;cream/80">{s.label}</p>
            </div>
          ))}
        </div>

        {/* Reviews grid */}
        <div className="grid grid&mdash;cols&mdash;1 md:grid&mdash;cols&mdash;2 gap&mdash;6">
          {reviews.map((review, i) => (
            <div key={i} className="bg&mdash;cream text&mdash;ink p&mdash;8 border&mdash;4 border&mdash;ink relative">
              <div className="absolute &mdash;top&mdash;3 &mdash;left&mdash;3 bg&mdash;otis&mdash;red text&mdash;cream w&mdash;12 h&mdash;12 flex items&mdash;center justify&mdash;center border&mdash;4 border&mdash;ink font&mdash;display text&mdash;xl">
                &ldquo;
              </div>
              <div className="flex items&mdash;center justify&mdash;between mb&mdash;4 mt&mdash;2">
                <div className="flex gap&mdash;1">
                  {[1,2,3,4,5].map(j => (
                    <svg key={j} className="w&mdash;4 h&mdash;4 fill&mdash;otis&mdash;red" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l&mdash;5 4.87 1.18 6.88L12 17.77l&mdash;6.18 3.25L7 14.14 2 9.27l6.91&mdash;1.01L12 2z"/></svg>
                  ))}
                </div>
                <span className="font&mdash;mono text&mdash;xs uppercase tracking&mdash;widest font&mdash;bold text&mdash;ink&mdash;mute">{review.source}</span>
              </div>
              <p className="text&mdash;ink leading&mdash;relaxed mb&mdash;4 font&mdash;medium">{review.body}</p>
              <p className="font&mdash;mono text&mdash;xs uppercase tracking&mdash;widest font&mdash;bold text&mdash;otis&mdash;red">â€” {review.author}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
