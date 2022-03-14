import { gql } from '@apollo/client'

// TODO: check if graphql-ruby gem generates queries
export const GET_USERS = gql`
  query GetUsers {
    users {
      id
      name
      email
      createdAt
      updatedAt
    }
  }
`
export const GET_USERS_LOCAL = gql`
  query GetUsersLocal {
    users @client {
      id
      name
      email
      createdAt
      updatedAt
    }
  }
`

export const CREATE_USER = gql`
  mutation CreateUser($input: CreateUserInput!) {
    createUser(input: $input) {
      user {
        id
        name
        email
      }
    }
  }
`
// TODO: be impliment
export const DELETE_USER = gql`
  mutation DeleteUser($input: UpdateUserInput!) {
    updateUser(input: $input) {
      user {
        id
        name
        email
      }
    }
  }
`

export const UPDATE_USER = gql`
  mutation UpdateUser($input: UpdateUserInput!) {
    updateUser(input: $input) {
      user {
        id
        name
        email
      }
    }
  }
`
