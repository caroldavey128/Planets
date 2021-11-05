//
//  ViewController.swift
//  Planets
//
//  Created by John Davey Ferrer on 2021-10-19.
//

import UIKit

class ViewController: UIViewController {
    
    // Connect UITableView to ViewController
    @IBOutlet var tableView: UITableView!
    
    // Create an array of planet names
    let planetNames = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
    
    // Create an array of planet images (files added in Assets)
    let planetImages = [UIImage(named: "Mercury"), UIImage(named: "Venus"), UIImage(named: "Earth"), UIImage(named: "Mars"), UIImage(named: "Jupiter"), UIImage(named: "Saturn"), UIImage(named: "Uranus"), UIImage(named: "Neptune")]
    
    // Create an array of YouTube Videos describing the planets
    let planetVideos = ["https://www.youtube.com/embed/0KBjnNuhRHs", "https://www.youtube.com/embed/BvXa1n9fjow", "https://www.youtube.com/embed/HCDVN7DCzYE", "https://www.youtube.com/embed/D8pnmwOXhoY", "https://www.youtube.com/embed/PtkqwslbLY8", "https://www.youtube.com/embed/epZdZaEQhS0", "https://www.youtube.com/embed/m4NXbFOiOGk", "https://www.youtube.com/embed/NStn7zZKXfE"]
    
    // Create an array of planet descriptions
    let planetDescriptions = ["Mercury is the first of the four terrestrial planets. This means it is a planet made mostly of rock. The planets closest to the Sun—Venus, Earth, and Mars—are the other three. Mercury is the smallest of the terrestrial planets. It has an iron core that accounts for about 3/4 of its diameter. Most of the rest of the planet is made up of a rocky crust. Because it is so close to the Sun, it is very difficult to see Mercury. A NASA mission called Messenger is expected to begin orbiting the planet in 2011. It is expected that this will help us learn a great deal more about this rarely seen planet.", "Of all the planets, Venus is the one most similar to Earth. In fact, Venus is often called Earth's “sister” planet. As similar as it is in some ways, however, it is also very different in others. Earth and Venus are similar in size. The two planets are very close to each other as they orbit the Sun; because of this, Venus is the most visible planet in the night sky. Both planets are relatively young, judging from the lack of craters on their surfaces. We now know that the environment on Venus couldn't support life as Earth does. Our atmosphere is a breathable mix of oxygen and other gases, but the atmosphere on Venus is mostly carbon dioxide, which is a poisonous gas.", "The Earth is the only planet known where life exists. Almost 1.5 million species of animals and plants have been discovered so far, and many more have yet to be found. While other planets may have small amounts of ice or steam, the Earth is 2/3 water. Earth has perfect conditions for a breathable atmosphere. Earth is the largest of the terrestrial planets and the fifth largest in the solar system. It is believed to be about 4.5 billion years old, which makes it very young compared to other celestial bodies!", "No planet has sparked the imaginations of humans as much as Mars. It may be the reddish color of Mars, or the fact that it can often be easily seen in the night sky, that has caused people to wonder about this close neighbor of ours. Tales of “Martians” invading Earth have been around for well over fifty years. But is it likely that any kind of life really does exist on Mars? Scientists aren't sure. Life as we know it couldn't survive there. Even so, there is evidence that there may be water on Mars. The presence of methane, which may be given off by organisms, provides another clue. Does this all mean you need to be concerned about an alien attack from Mars? Hardly. Still, as we learn more and more about the final terrestrial planet, the more mysterious and wonderful Mars becomes.", "The planet Jupiter is the first of the gas giant planets. Made mostly of gas, they include Jupiter, Saturn, Uranus, and Neptune. Jupiter is first among the planets in terms of size and mass. Its diameter is 11 times bigger than Earth, and its mass is 2.5 times greater than all the other planets combined. The “Great Red Spot” on Jupiter is actually a raging storm. This giant planet comes in first again when it comes to giving off heat. The core of Jupiter may be made of liquid rock that reaches temperatures of 43,000° F (23,870° C). There are at least 63 moons of different sizes orbiting Jupiter. That's the most of any planet. Its largest moon is called Ganymede. It has a diameter of 3,400 miles (5,472 km)—larger than Mercury!", "Most people know about the rings around Saturn, because they are the brightest and most colorful. These rings are made mainly out of ice particles orbiting the planet. While the rings themselves seem big, the particles are very small, usually no more than 10 feet (3 meters) wide. Saturn is the second largest planet. It is the farthest planet from the Earth that can be seen without a telescope. It appears flat at the poles because its great rotational speed makes the middle of the planet bulge.", "Uranus is the first planet so far away from the Earth that it can only be seen with the use of a telescope. When it was first discovered in 1781, scientists didn't know what they had found. As astronomers studied the object more closely, they discovered that it had a circular orbit around the Sun. They had found the seventh planet.Uranus is so far from the Sun that it takes 84 years to complete an orbit of the Sun. It is the only planet that spins on its side, so each pole is tilted away from the Sun for half its orbit. That means each night and day lasts an amazing 42 years. Imagine staying awake that long! Of course, you'd also get a lot of time to catch up on your sleep!", "Imagine being so good at math that you could figure out the location of a planet you had never even seen! That is what John C. Adams did in 1843 when he discovered Neptune. Neptune was named after the Roman god of the sea because it is so far out in the deep “sea” of space. The name also fits because Neptune appears to be a beautiful bright blue because of the methane clouds that surround it. It is the most distant planet from the Sun. It takes a very long time—165 years—to orbit the Sun. Neptune has made only one trip around the Sun since it was discovered."]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// Create function to display the Content View of selected planet when user select a row
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // I use instantiateViewController instead of Seque
      if let viewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController {
          viewController.planetName = planetNames[indexPath.row]
         viewController.planetImage = UIImage(named: planetNames[indexPath.row])!
        viewController.planetDescription = planetDescriptions[indexPath.row]
           viewController.youtube = planetVideos[indexPath.row]
           self.navigationController?.pushViewController(viewController, animated: true)
     }
        
        
    }
}

// Calling the array of planetNames and planetImages into the TableView cell
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return planetNames.count
          
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = planetNames[indexPath.row]
        cell.imageView?.image = planetImages[indexPath.row]
        return cell
    }
}


