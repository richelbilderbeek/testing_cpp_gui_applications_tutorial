#!/bin/bash
function cowsay_twice
{
  cowsay "$@"
  cowsay -f stegosaurus "$@" 
}