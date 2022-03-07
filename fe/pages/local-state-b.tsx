import { VFC } from 'react'
import { LocalStateB } from '../components/LocalStateB'
import { Layout } from '../components/Layout'

export const LocalStatePageB: VFC = () => {
  return (
    <Layout title="Local State B">
      <LocalStateB />
    </Layout>
  )
}

export default LocalStatePageB
