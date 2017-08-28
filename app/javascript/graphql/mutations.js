import gql from 'graphql-tag';

export const addFavorite = 
  gql`mutation addFavorite($city_id: ID!, $visited: Boolean!) {
    addFavorite(input: {city_id: $city_id, visited: $visited }) {
      favorite{
        id
      }
    }
  }`;
  
export const addTopic = 
  gql`mutation addTopic($city_id: ID, $title: String, $text: String) {
    addTopic(input: {city_id: $city_id, title: $title, text: $text }) {
      topic{
        id
      }
    }
  }`;  
  
export const addRating = 
  gql`mutation addRating($city_id: ID, $rate: Int, $rate_type: String) {
    addRating(input: {city_id: $city_id, rate: $rate, rate_type: $rate_type }) {
      rating{
        id
      }
    }
  }`;
  
export const addComment = 
  gql`mutation addComment($topic_id: ID, $text: String!) {
    addComment(input: {topic_id: $topic_id, text: $text }) {
      comment{
        id
      }
    }
  }`; 
  