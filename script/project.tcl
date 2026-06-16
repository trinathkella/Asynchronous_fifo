# Create project

create_project async_fifo_proj ./Asynchronous_fifo -force

# Add RTL

add_files [glob ./rtl/*.sv]

# Add TB

add_files -fileset sim_1 [glob ./tb/*.sv]

# Add constraints

add_files -fileset constrs_1 [glob ./constraints/*.xdc]

# Update compile order

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

save_project_as async_fifo_proj ./Asynchronous_fifo

close_project