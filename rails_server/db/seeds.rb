# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
clients = Client.create([
  {
    name: "Wendell Doe",
    bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    intro: "Wendell lived without a home for 25 years. Then, he met Search. Here is how we helped him.",
    embed_html: '<iframe align="middle" src="https://player.vimeo.com/video/211739160" width="640" height="360" frameborder="0" webkitallowfullscreen
    mozallowfullscreen allowfullscreen></iframe>',
    featured: true,
    private: false,
    picture_url: "https://i.imgur.com/VKa54Wk.png"
  }
])

events = Event.create([
  {
    title: 'First Met With Search',
    icon: 'fa-handshake-o',
    date: '2014-03-10 00:00:00 UTC',
    description: 'Wendell first met with Search. Search went over his goals and expectations. We outlined a plan for him to get his life back on track.',
    client_id: Client.first.id
  },
  {
    title: 'Applied for Housing Voucher',
    icon: 'fa-home',
    date: '2014-03-20 00:00:00 UTC',
    description: "The housing choice voucher program is the federal government's major program for assisting very low-income families, the elderly, and the disabled to afford decent, safe, and sanitary housing in the private market. We helped Wendall apply for and fill out the application needed to qualify for and eventually get a housing voucher.",
    client_id: Client.first.id
  },
  {
    title: 'Meeting with Case Worker',
    icon: 'fa-users',
    date: '2014-04-15 00:00:00 UTC',
    description: "Wendell met with his case worker. He relayed information regarding his search for an apartment with us. Because of his criminal history, it is difficult for him to find a renter willing to rent to him. However, we are still ongoing and looking for a place for him.",
    client_id: Client.first.id
  },
  {
    title: 'Found an Apartment!',
    icon: 'fa-check',
    date: '2014-04-20 00:00:00 UTC',
    description: "After weeks of looking, Wendell found an apartment that would accept his criminal history. His journey with Search may have come to an end, but he is committed to becoming involved again and helping those who were in his shoes before.",
    client_id: Client.first.id
  }
])