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
