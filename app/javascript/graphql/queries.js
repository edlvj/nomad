import gql from 'graphql-tag';

export const cities = 
  gql`query {
    cities { 
      id, 
      title,
      image
    }
  }`;
  
export const city =
  gql`query City($id: ID!) {
   city(id: $id) {
      id,
      title_eng,
      title,
      image,
      price{
        airbnb{
          price,
          url
        },
        fin_req
      },
      traveler {
        couchsurf {
          hosts,
          url
        },  
        country,
        region
      },
      ratings{
        fun_avg,
        quality_life_avg,
        safe_avg,
        toward_avg
      },
      excursions{
        data {
          title,
          url
        },
        url,
      },
      topics{
        id,
        title,
        text,
        user_image
     }
    }
  }`;
 
export const topic = 
  gql`query Topic($id: ID!) {
    topic(id: $id) {
      id,
      title,
      text,
      user,
      created,
      comments {
        id,
        text,
        user_id,
        user_image,
        created_at
      }
    }
  }`;
  

export const user = 
  gql`query User($id: ID!){
    user(id: $id) {
      id,
      nickname,
      image,
      visit,
      visited,
      favorite {
        id,
        city,
        visited,
        position{
          lng,
          lat
        }
      }
    }
  }`;
 
 
 