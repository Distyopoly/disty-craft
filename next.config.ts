import type { NextConfig } from "next";
import path from "path";


const nextConfig: NextConfig = {
  /* config options here */
  turbopack: {
    root: path.resolve(__dirname),
  },
  experimental : {
    optimizePackageImports: ["@chakra-ui/react"],
  }
};

export default nextConfig;
