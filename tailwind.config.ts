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
