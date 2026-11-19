{ pkgs, pkgsUnstable, ... }:

{
  home.packages =
    ( with pkgs; [
      # Empty for now.
    ]) ++ ( with pkgsUnstable; [
      # Empty for now.
    ]);
}
