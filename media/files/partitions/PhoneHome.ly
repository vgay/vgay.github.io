\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Phone Home"
composer = #"John Scofield"
meter = #"(Med. Funk)"
kwtempo = #"Medium"
kwstyle = #"Funk"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"John Scofield" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=V-M2CiI_3d8"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  meter =  \markup \concat {
  "Half-Time Feel " \raise #0.5 \note-by-number #1 #0 #0.8 " = 80"
}
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #2
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  b1*5:m7 g4.:7+/b a8:7/cis s1 fis4./ais b8:m7 s1*2 g4.:7+/b a8:7/cis s1 ges4./bes as4:m7 ges/bes as8:m7 s2 des1/es
  ges4.:7+/bes as8:7/c s1 f4./a bes8:m7 s1*2
  ges4.:7+/b as8:7/cis s1 f4./bes
g4:m7 f/a g8:m7 s2 c2./d g4 s1 g
b1*4:m7 b:m7
}


structure = {
  \showStartRepeatBar \bar "[|:"
  \mark \markup \box Intro
  \repeat volta 2 { s1*3 }  \alternative { { s1 } { s1 } }\break
  \mark \markup { \box A \raise #1 \with-color #red \bold \larger \musicglyph "scripts.varsegno" }
  \repeat volta 2 { s1*4 \break s1*4 \break s1*4 \break s1*4 }
  \alternative { { s1 } { s1 } }
  \break
  \doubleMark \markup \with-color #red fine  \markup \box B
  \repeat volta 2 { s1*4 }
  \break \mark #3 \repeat unfold 3 {  s1*4 \break } s1*4
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup \right-column {
    \line { Solon on \box A (2nd ending) & \box B }
    \line { then \with-color #red { D.S. al Fine } (no repeat)}
  }
  \bar ".."
}

theNotes =  \relative c' {
 \key g \major \time 4/4
  \inlineMMRN R1*3 | R1 r2 r8 b cis e
  <b d g>4. <cis e a>8~ q2~ q <ais cis fis>4.<a d fis>8~ | q1~ | q
  <b d g>4. <cis e a>8~ q2~ | q <bes des ges>4. <ges ces es>8 |
  r <bes des ges> r <ces es as> r bes' ges des | <des f as>4. q8~ q2
  <bes des ges>4. <c es as>8~ q2~ q <a c f>4.<as des f>8~ | q1~ | q
  <bes des ges>4. <c es as>8~ q2~ q <a c f>4. <f bes d>8 |
  r <a c f> r <bes d g> r a' f c | <c e g>4. 8 r4 <b d g>4~ | q2~ q8 b cis e | <b d g>1 \repeatTie
  \inlineMMRN R1*4
  d'4. cis8 r8 b r a | <d, fis>4 q <cis e>2~ | 1~ | 1
 <b d>4. <d f>8~ q4 <g, cis>4~ | q8 <fis b>4.~ 2~ | 1~ | 2 r4 r8 cis''
 d4. cis8 r8 b r a | <d, fis>4 q <cis e>2~ | 1~ | 1~
 1~ 1~ 1 | |r2 r8 b cis e
}


Basse = \relative c, {
  \clef "bass_8" \key g \major \time 4/4
  b4. b'8 r b, r4 | b r r f'8 fis | b,4. b'8 r b, r4 | b r r2 | b4 r r8 e fis a
  b fis r g cis2~ | 2 ais4. b8~ | 8 b, r b b'4 r | r2 r8 e, fis a
  b fis r g cis2~ | 2 bes4. as8 | r bes r as r as g bes, | es4. 8 r8 4.
  bes8 f r ges c2~ | 2 a4. bes8 | r8 bes r4 bes'8 bes,8 r4 |  r2 r8 es f as
  bes f r ges c2~ | 2 a4. g8 | r a  r g r g f c | d4. 8 r4 g,4~
  2~ 8 e' fis a | g,1 \repeatTie
 b4. b'8 r b, r4 | b r4 r2 | b4. b'8 r b, r4 | b r4 r2 |
 b4. b'8 r2 b,2 b' | b,4. b'8 r b, r4 | b r r f'8 fis
 b,4. b'8~ 2~ | 8 b,4.~ 4 f'8 fis | b,4. b'8 r b, r4 | b8 b r4 e8 fis a ais
  b,4. b'8 r b, r4 | b8 b a e g2~ | 4. g'8~ 8 g, r4 | g2. cis8 d
   g,4. g'8 r g, r4 | g2~ 8 g' d4 | g,4. g'8 r g, r4 | g r r8 e' fis a
}

grille = \chordmode {
  \bar "[|:"

  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \structure
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } {  \clef "treble_8" \theNotes \label #'theLastPage }
          \new Staff \Basse
      >> >>

} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Devnull \structure
          \new Staff \with { instrumentName = \Bb } { \transpose c d \theNotes \label #'theLastPage }
      >>

} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Devnull \structure
          \new Staff \with { instrumentName = \Eb } { \transpose c a \theNotes \label #'theLastPage }
      >>

} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \structure
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } {  \clef "treble_8" \theNotes \label #'theLastPage }
          \new Staff \Basse
      >> >>

} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Devnull \structure
          \new Staff \with { instrumentName = \Bb } { \transpose c d \theNotes \label #'theLastPage }
      >>

} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Devnull \structure
          \new Staff \with { instrumentName = \Eb } { \transpose c a \theNotes \label #'theLastPage }
      >>

} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \\grille
% } } }

% \book {
%   %\paper { %page-count = #1
%	#(set-paper-size "a4")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSa4")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \transpose c a \grille
% } } }

% \book {
%   %\paper { %page-count = #2
%	#(set-paper-size "tablette")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSTab")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
% } } }