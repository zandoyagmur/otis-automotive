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
