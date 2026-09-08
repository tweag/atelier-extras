# Project Conventions

## Commits

This project uses [scoped commits](https://scopedcommits.com/) to better
distinguish what parts of the project a commit touches.

## Changelog

This project has one changelog for each published package. Make sure to update
the changelog accordingly for user-visible changes. Describe in the change log
line whether the change is breaking or not.

## Releases

When cutting a new release:

1. Make a new heading in the changelog with the release date.
2. Move everything in `[Unreleased]` under the new heading for the released
   version.
3. Bump the version number in the package's `package.nix`.
4. Run `nix-hpack` to update the `.cabal` file.
