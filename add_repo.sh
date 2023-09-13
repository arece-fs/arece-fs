#!/bin/bash

PERMISSION="pull" # Can be one of: pull, push, admin, maintain, triage
ORG="arece-fs"

# Get names with `gh repo list orgname`
REPOS=(
  "arece_docker"
  "arece_bot"
  "arece-website"
  "arece_state_machine_python"
  "arece-trajectory"
  "ros_can"
  "arece_stereo_python"
  "arece_pos_transform_cpp"
  "arece_odometry_cpp"
  "arece_marker_debug_cpp"
  "arece_compet_python"
  "arece_vel_to_acc_cpp"
  "arece_lidar_cpp"
  "arece_perception_cpp"
  "arece-sim"
  "arece-fs"
  "eufs_msgs"
  "arece-mcap-mysql"
  "arece-stereo-calibration"
  "arece_marker_debug_py"
  "arece_fusion"
  "arece_msgs"
  "resultm_py"
  "arece_motor_command_motor_cpp"
  "arece_prototype2023"
  "arece-sim-web-docker"
  "arece-jetson"
)

TEAMS=(
  "trajectory"
  "perception"
  "manufacturing"
  "devops"
  "control"
)

for TEAM in "${TEAMS[@]}"; do
  for REPO in "${REPOS[@]}"; do
    echo "Adding repo ${REPO} to Org:$ORG Team:$TEAM_SLUG"

    # https://docs.github.com/en/rest/teams/teams#add-or-update-team-repository-permissions
    # (needs admin:org scope)
    # --silent added to make it less noisy

    gh api --method PUT -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" --silent /orgs/$ORG/teams/$TEAM/repos/$ORG/$REPO -f permission=$PERMISSION && echo "Success" || echo "Failed"

    echo "============================================================"
  done
done
