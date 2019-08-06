# LosOce_StopWP
 Los Oceanic: Stop Weapon Drops. Diable Ped's dropping weapons based on distance & peds. [Feat: Ignorelist]

### Hypothosis

To apply a search area around the clients ped, to find all active peds(or ignore them) within that radius and set them to not drop guns. 
Also cleaning up a little bit by forcing the dead to despawn and setting all live peds as no longer required to let the server remove them when out of frame.

## Prerequisites

* essentialmode
* es_extended

## Modifications to ESX
**You NEED to add a function into ESX to get this to work**

Within es_extended/client/functions.lua,
At the bottom, just add... 
```

```

Just add it to your server.cfg
As with all things ESX, make sure your load order is correct

```
start essentialmode
...
start es_extended
... 
start LosOce_StopWP
```

## License

This project is licensed under the GNU v3.0 License - see the [LICENSE.md](LICENSE) file for details

## Acknowledgments

* 
