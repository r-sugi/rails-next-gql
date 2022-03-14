import { VFC, memo, Dispatch, SetStateAction } from 'react'
import { User } from "../types/generated/graphql"

interface Props {
  user: Pick<User, 'id' | 'name' | 'email' | 'createdAt' | 'updatedAt'>
  // delete_users_by_pk: DeleteUserMutationFn
  setEditedUser: Dispatch<
    SetStateAction<{
      id: string
      name: string
      email: string
    }>
  >
}

// eslint-disable-next-line react/display-name
export const UserItem: VFC<Props> = memo(({
  user,
  // delete_users_by_pk, // TODO:
  setEditedUser
}) => {
  console.log('UserItem rendered')
  return (
    <div className="my-1">
      <span className="mr-2">{user.id}</span>
      <span className="mr-2">{user.name}</span>
      <span className="mr-2">{user.email}</span>
      <span className="mr-2">{user.createdAt}</span>
      <button
        className="mr-1 py-1 py-3 text-white bg-green-600 hover:bg-green-700 rounded-2xl focus:outline-none"
        data-testid={`edit-${user.id}`}
        onClick={() => {
          setEditedUser(user)
        }}
      >
        Edit
      </button>
      {/* <button
        className="py-1 py-3 text-white bg-pink-600 hover:bg-pink-700 rounded-2xl focus:outline-none"
        data-testid={`delete-${user.id}`}
        onClick={async () => {
          await delete_users_by_pk({
            variables: {
              id: user.id
            }
          })
        }}
      >
        Delete
      </button> */}
    </div>
  )
})
