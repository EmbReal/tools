FROM ubuntu:22.04
ARG USERNAME=quality
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get upgrade -y && apt-get install -y cloc pip libpcre3 libpcre3-dev cmake git
RUN pip install lizard cpplint

RUN cd /opt && git clone https://github.com/danmar/cppcheck.git /opt/cppcheck && cd /opt/cppcheck && git checkout 2.10.3 && mkdir build && cd build && cmake -DHAVE_RULES=ON .. && cmake --build .
ENV PATH="$PATH:/opt/cppcheck/build/bin"

USER $USERNAME