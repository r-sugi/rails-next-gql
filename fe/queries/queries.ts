import { gql } from '@apollo/client'

// TODO: check if graphql-ruby gem generates queries
export const GET_USERS = gql`
  query Getusers {
    users {
      id
      name
      email
      createdAt
      updatedAt
    }
  }
`
