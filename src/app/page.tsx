import NextLink from "next/link";
import { Link as ChakraLink } from '@chakra-ui/react'


export default function Home() {
  return (
    <>
      <h1>Welcome</h1>
      <ChakraLink asChild>
        <NextLink href="session">Start a new session</NextLink>
      </ChakraLink>
    </>
  )
}
