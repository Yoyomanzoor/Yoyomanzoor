---
layout: page
title: Hyprland Rice
description: My Arch Rice
img: assets/img/hyprland.png
importance: 1
category: programming
related_publications: false
---

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/hyprland.png" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>
<div class="caption">
    Screenshot of the rice.
</div>

{% include repository/repo.liquid repository='yoyomanzoor/dotfiles' %}

The past two weeks, I've been building an Arch rice with these specs:

- WM: Hyprland
- Terminal: alacritty, kitty
- Shell: fish + starship
- IDE: nvim, vscode, rstudio
- Bar: ags
- dmenu: ags, anyrun
- Browser: qutebrowser, firefox

It's been a lot of fun (and a great way to procrastinate real work) to learn `ags` and working through configs. Currently, the desktop is stable and my daily driver. It works flawlessly at the moment. I've found it both entertaining and annoying to have built the environment I work in, on one hand it's tailored to what I make it do. On the other, if I want it to do something, I need to build and test that thing myself. For example, I can't just open up a widget store and install a specific widget (like in gnome or KDE). But, if I have the time, I could just make the app myself - e.g., I set up a prayer time widget, complete with notifications. So while I'm glad it works well enough I can use it daily, I have a long running list of things to build for it.

This has been an interesting journey. It began when I bought a laptop last year and set it up as a Windows/Kubuntu dual boot. I was dual booting using an external SSD, which worked fine but was a little annoying to carry around a SSD everywhere. I was trying to get used to tiling windows managers using KWin Tiling/Bismuth. I then started using VMs running Ubuntu, originally since I needed RStudio and RStudio was not available at the time for Ubuntu 22.04 (which Kubuntu was built on). I ran Ubuntu with i3 (Regolith), and before I knew it I was spending more time in Ubuntu than Kubuntu because I found the tiling manager to be extremely responsive. It was also easy to customize using configs. I also tried VMs running EndeavourOS/Hyprland or Arch/Hyprland, but I was having a problem with GPU passthrough (my laptop has the newer Intel ARC GPUs, and I couldn't find a good way to passthrough). Eventually I decided to start anew, bought an NVME and installed Arch + Hyprland, and here we are!

