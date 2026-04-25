import Nav from "@/components/Nav";
import Hero from "@/components/Hero";
import Story from "@/components/Story";
import Services from "@/components/Services";
import Reviews from "@/components/Reviews";
import ServiceForm from "@/components/ServiceForm";
import Visit from "@/components/Visit";
import Footer from "@/components/Footer";

export default function Home() {
  return (
    <>
      <Nav />
      <Hero />
      <Story />
      <Services />
      <Reviews />
      <ServiceForm />
      <Visit />
      <Footer />
    </>
  );
}
