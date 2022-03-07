import { makeVar } from '@apollo/client'
interface User {
  name: string
}
export const userVar = makeVar<User[]>([])
