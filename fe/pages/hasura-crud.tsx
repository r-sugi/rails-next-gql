import { VFC, useState, FormEvent } from 'react'
import { useQuery, useMutation } from "@apollo/client";
import {
  GET_USERS,
  CREATE_USER,
  // DELETE_USER,
  UPDATE_USER
} from "../queries/queries";
import {
  GetUsersQuery,
  CreateUserMutation,
  // DeleteUserMutation,
  UpdateUserMutation
} from "../types/generated/graphql";

import { Layout } from '../components/Layout'
import { UserItem } from "../components/UserItem";

const HasuraCRUD: VFC = () => {
  const [editedUser, setEditedUser] = useState({ id: '', name: '', email: '' })

  const { data, error } = useQuery<GetUsersQuery>(GET_USERS, {
    fetchPolicy: 'cache-and-network'
  })
  const [updateUser] = useMutation<UpdateUserMutation>(UPDATE_USER)

  const [createUser] = useMutation<CreateUserMutation>(CREATE_USER, {
    // TODO: cache
    // update(cache, { data: { createUser } }) {
    //   const cacheId = cache.identify(createUser)
    //   cache.modify({
    //     fields: {
    //       users(existingUsers, { toReference }) {
    //         return [toReference(cacheId), ...existingUsers]
    //       }
    //     }
    //   })
    // }
  })

  // const [delete_users_by_pk] = useMutation<DeleteUserMutation>(DELETE_USER, {
  //   update(cache, { data: { delete_users_by_pk } }) {
  //     cache.modify({
  //       fields: {
  //         users(existingUsers, { readField }) {
  //           return existingUsers.filter(
  //             (user) => delete_users_by_pk.id !== readField('id', user)
  //           )
  //         }
  //       }
  //     })
  //   }
  // })

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    if (editedUser.id) {
      try {
        await updateUser({
          variables: {
            id: editedUser.id,
            name: editedUser.name,
            email: editedUser.email
          }
        })
      } catch (err) {
        alert(err.message)
      }
      setEditedUser({ id: '', name: '', email: ''})
    } else {
      try {
        await createUser({
          variables: {
            name: editedUser.name,
            email: editedUser.email
          },
        })
      } catch (error) {
        alert(error.message)
      }
      setEditedUser({ id: '', name: '', email: ''})
    }
  }

  if (error) return <Layout title="Hasura CRUD">Error: {error.message}</Layout>

  return (
    <Layout title="Hasura CRUD">
      <p className="mb-3 font-bold">Hasura CRUD</p>
      <form
        className="flex flex-col justify-center items-center"
        onSubmit={handleSubmit}
      >
        <input
          className="px-3 py-2 border border-gray-300"
          placeholder="New user name?"
          type="text"
          value={editedUser.name}
          onChange={(e) => {
            setEditedUser({ ...editedUser, name: e.target.value })
          }}
        />
        <input
          className="px-3 py-2 border border-gray-300"
          placeholder="New user email?"
          type="text"
          value={editedUser.email}
          onChange={(e) => {
            setEditedUser({ ...editedUser, email: e.target.value })
          }}
        />
        <button
          disabled={!editedUser.name}
          className="disabled:opacity-40 my-3 py-1 px-3 text-white bg-indigo-600 hover:bg-indigo-700 rounded-2xl focus:outline-none"
          data-testid="new"
          type="submit"
        >
          {editedUser.id ? 'Update' : 'Create'}
        </button>
      </form>

      {data?.users.map((user) => {
        return (
          <UserItem
            key={user.id}
            user={user}
            setEditedUser={setEditedUser}
            // delete_users_by_pk={delete_users_by_pk}
          />
        )
      })}
    </Layout>
  )
}

export default HasuraCRUD
