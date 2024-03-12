{ config, pkgs, ... }: {
    services.xserver.videoDrivers = [ "amdgpu" ]; # make sure this module is loaded in hardware config

    hardware.opengl.driSupport = true; # to enable Vulkan support
    hardware.opengl.extraPackages = [ pkgs.amdvlk ]; # enables AMD-Vulkan as main gpu-accel driver
    hardware.opengl.extraPackages32 = [ pkgs.driversi686Linux.amdvlk ]; # for 32-bit apps
}
