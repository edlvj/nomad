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
      rating{
        fun_avg,
        quality_life_avg,
        safe_avg,
        toward_avg
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
  
export const cityTraveler = 
  gql`query City_traveler($id: ID!){
    city_traveler(id: $id) {
      couchsurf {
        hosts,
        url
      },  
      country,
      region
    }
  }`;
  
export const cityPrice = 
  gql`query City_price($id: ID!){
    city_price(id: $id) {
      airbnb {
        price,
        url
      },
      meal {
        price,
        url
      },
      fin_req
    }
  }`;
  
export const cityExcursion = 
  gql`query city_excursions($id: ID!){
    city_excursions(id: $id) {
      data {
        title,
        url
      },
      url
    }
  }`;
 
 
 
 
 