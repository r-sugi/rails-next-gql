import { VFC } from 'react'
import { userVar } from '../cache'
import { useReactiveVar } from '@apollo/client'
import Link from 'next/link'

export const LocalStateB: VFC = () => {
  const users = useReactiveVar(userVar)
  return (
    <>
      {users.map((user, index) => {
        return (
          <p className="mb-3" key={index}>
            {user.name}
          </p>
        )
      })}
      <Link href="/local-state-a">
        <a>Back</a>
      </Link>
    </>
  )
}
